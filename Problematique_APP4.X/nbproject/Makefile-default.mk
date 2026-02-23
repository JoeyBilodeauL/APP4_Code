#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=uart.c timer.c pwm.c mef.c main.c led.c iopins.c adc.c parite.S analyse_parite.S dataTranfert.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/uart.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/pwm.o ${OBJECTDIR}/mef.o ${OBJECTDIR}/main.o ${OBJECTDIR}/led.o ${OBJECTDIR}/iopins.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/parite.o ${OBJECTDIR}/analyse_parite.o ${OBJECTDIR}/dataTranfert.o
POSSIBLE_DEPFILES=${OBJECTDIR}/uart.o.d ${OBJECTDIR}/timer.o.d ${OBJECTDIR}/pwm.o.d ${OBJECTDIR}/mef.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/led.o.d ${OBJECTDIR}/iopins.o.d ${OBJECTDIR}/adc.o.d ${OBJECTDIR}/parite.o.d ${OBJECTDIR}/analyse_parite.o.d ${OBJECTDIR}/dataTranfert.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/uart.o ${OBJECTDIR}/timer.o ${OBJECTDIR}/pwm.o ${OBJECTDIR}/mef.o ${OBJECTDIR}/main.o ${OBJECTDIR}/led.o ${OBJECTDIR}/iopins.o ${OBJECTDIR}/adc.o ${OBJECTDIR}/parite.o ${OBJECTDIR}/analyse_parite.o ${OBJECTDIR}/dataTranfert.o

# Source Files
SOURCEFILES=uart.c timer.c pwm.c mef.c main.c led.c iopins.c adc.c parite.S analyse_parite.S dataTranfert.S



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX370F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/parite.o: parite.S  .generated_files/flags/default/464fad9327114912d0350b6e320b270a5ea9a057 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/parite.o.d 
	@${RM} ${OBJECTDIR}/parite.o 
	@${RM} ${OBJECTDIR}/parite.o.ok ${OBJECTDIR}/parite.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/parite.o.d"  -o ${OBJECTDIR}/parite.o parite.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/parite.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/parite.o.d" "${OBJECTDIR}/parite.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/analyse_parite.o: analyse_parite.S  .generated_files/flags/default/4aed868706f4327fca31a9a9990e871b08507d6a .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/analyse_parite.o.d 
	@${RM} ${OBJECTDIR}/analyse_parite.o 
	@${RM} ${OBJECTDIR}/analyse_parite.o.ok ${OBJECTDIR}/analyse_parite.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/analyse_parite.o.d"  -o ${OBJECTDIR}/analyse_parite.o analyse_parite.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/analyse_parite.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/analyse_parite.o.d" "${OBJECTDIR}/analyse_parite.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/dataTranfert.o: dataTranfert.S  .generated_files/flags/default/274a4944ef80da0d9e55448de95dd9b48803ea11 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dataTranfert.o.d 
	@${RM} ${OBJECTDIR}/dataTranfert.o 
	@${RM} ${OBJECTDIR}/dataTranfert.o.ok ${OBJECTDIR}/dataTranfert.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/dataTranfert.o.d"  -o ${OBJECTDIR}/dataTranfert.o dataTranfert.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/dataTranfert.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/dataTranfert.o.d" "${OBJECTDIR}/dataTranfert.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/parite.o: parite.S  .generated_files/flags/default/a34f29bad4de1aec4bff636d1b35fc11cb82476d .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/parite.o.d 
	@${RM} ${OBJECTDIR}/parite.o 
	@${RM} ${OBJECTDIR}/parite.o.ok ${OBJECTDIR}/parite.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/parite.o.d"  -o ${OBJECTDIR}/parite.o parite.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/parite.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/parite.o.d" "${OBJECTDIR}/parite.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/analyse_parite.o: analyse_parite.S  .generated_files/flags/default/3b1a9e0fd6eb618047f01f23a3ee701c3783cc7f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/analyse_parite.o.d 
	@${RM} ${OBJECTDIR}/analyse_parite.o 
	@${RM} ${OBJECTDIR}/analyse_parite.o.ok ${OBJECTDIR}/analyse_parite.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/analyse_parite.o.d"  -o ${OBJECTDIR}/analyse_parite.o analyse_parite.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/analyse_parite.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/analyse_parite.o.d" "${OBJECTDIR}/analyse_parite.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
${OBJECTDIR}/dataTranfert.o: dataTranfert.S  .generated_files/flags/default/36f5246fc5230f209b955d32d90d8f97c96fc608 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/dataTranfert.o.d 
	@${RM} ${OBJECTDIR}/dataTranfert.o 
	@${RM} ${OBJECTDIR}/dataTranfert.o.ok ${OBJECTDIR}/dataTranfert.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/dataTranfert.o.d"  -o ${OBJECTDIR}/dataTranfert.o dataTranfert.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/dataTranfert.o.asm.d",--gdwarf-2 -mdfp="${DFP_DIR}"
	@${FIXDEPS} "${OBJECTDIR}/dataTranfert.o.d" "${OBJECTDIR}/dataTranfert.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/default/732bdbe523ffb83878c9f5bcdab11c74f7f2df3e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/default/6e4c8fa8a5654174c007b6f1d4c3bddf7fd6f091 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d" -o ${OBJECTDIR}/timer.o timer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/pwm.o: pwm.c  .generated_files/flags/default/e5094b0f6364dbc26b8eb69d3cbf79715ec8198 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm.o.d 
	@${RM} ${OBJECTDIR}/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pwm.o.d" -o ${OBJECTDIR}/pwm.o pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mef.o: mef.c  .generated_files/flags/default/643e1e88957689ebeb3d6b94589b6b22f411e192 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mef.o.d 
	@${RM} ${OBJECTDIR}/mef.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mef.o.d" -o ${OBJECTDIR}/mef.o mef.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/919294d0808ee8fd116c19c091ad1b3b21338aa5 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/led.o: led.c  .generated_files/flags/default/bef07a7d429536877df41a8c05e8f3514f377abb .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/led.o.d 
	@${RM} ${OBJECTDIR}/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/led.o.d" -o ${OBJECTDIR}/led.o led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/iopins.o: iopins.c  .generated_files/flags/default/272afa159cce178ea1ee9e92350606f84b28a35 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/iopins.o.d 
	@${RM} ${OBJECTDIR}/iopins.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/iopins.o.d" -o ${OBJECTDIR}/iopins.o iopins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/adc.o: adc.c  .generated_files/flags/default/1b430dd9f17c5f05747c3716066f724ea2afe485 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/uart.o: uart.c  .generated_files/flags/default/f9db4481bedbf52d2a9219765524135430f2078e .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/uart.o.d 
	@${RM} ${OBJECTDIR}/uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/uart.o.d" -o ${OBJECTDIR}/uart.o uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/timer.o: timer.c  .generated_files/flags/default/27180f31d4d5bfc067fdc2f53aba1455dd32aa13 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/timer.o.d 
	@${RM} ${OBJECTDIR}/timer.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/timer.o.d" -o ${OBJECTDIR}/timer.o timer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/pwm.o: pwm.c  .generated_files/flags/default/ea2386c1a562576dff486ae32c449bc61310074f .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pwm.o.d 
	@${RM} ${OBJECTDIR}/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/pwm.o.d" -o ${OBJECTDIR}/pwm.o pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/mef.o: mef.c  .generated_files/flags/default/ff8f1f264af69e8cd40faa85c6cd7334c4cbdda6 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/mef.o.d 
	@${RM} ${OBJECTDIR}/mef.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mef.o.d" -o ${OBJECTDIR}/mef.o mef.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/91e45c265f66fbbd85495109dac634bd53bec8b9 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d" -o ${OBJECTDIR}/main.o main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/led.o: led.c  .generated_files/flags/default/9bd06fc1052cb55539df23fcd35aab577e500928 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/led.o.d 
	@${RM} ${OBJECTDIR}/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/led.o.d" -o ${OBJECTDIR}/led.o led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/iopins.o: iopins.c  .generated_files/flags/default/12fff443dfb590055f2f8cf1f9d4d999d281a26c .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/iopins.o.d 
	@${RM} ${OBJECTDIR}/iopins.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/iopins.o.d" -o ${OBJECTDIR}/iopins.o iopins.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/adc.o: adc.c  .generated_files/flags/default/5e86c19e5c2e4d4b06f46c525ae64cd5ea384ae7 .generated_files/flags/default/9482caba2dc1e17ca639a65609d3577e06590893
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/adc.o.d 
	@${RM} ${OBJECTDIR}/adc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/adc.o.d" -o ${OBJECTDIR}/adc.o adc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC0275F  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_PK3=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Problematique_APP4.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
