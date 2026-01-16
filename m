Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D86ED4A5E2
	for <ath12k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbJ0E6T3LBvjew4aO3Z1wvMfZiBEQELCcotF0vqyonk=; b=y4UKND5DQd4dTb4PLP/rSWRtEQ
	t1sts3n5TlN2HPVm+tyABGYRwoC2GtcWr8uk4aJW1A+6u0awUG7bSS1GOB7os8FNfRhV5FF5RCWeM
	tv1PJKTQtggbW7vZhcotzZjvko9Gwm/y0GcRURAPt83xrHnRUdsCZwVXjJ3EjZmAIzXZWuJqrApA4
	q413NfZof/Jc5f171bsB7AQCKHt+X7k4BnC5MtJF49bELfXBagngCSctvFXOpXdJmuuoNZySBAumc
	GA23/capwM6Gc7fKiboSuBwOaggPbapce7OtxKLRRTmWZZans1Xy2wcL99aP7ghPNXNqMyP0OrIBM
	4miF4gpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcG-0000000DQ1q-3PjA;
	Fri, 16 Jan 2026 01:27:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcF-0000000DQ1A-0WOv
	for ath12k@bombadil.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qbJ0E6T3LBvjew4aO3Z1wvMfZiBEQELCcotF0vqyonk=; b=aA5Ub4ijxqRecPjUcW77oLm/Hv
	duQHvNONuBA8xbgAXPUvJcPLnPBqSap3NSgFTzIeHZ9xDTk8ZxTZdQ2A3BH7DU5Wm69zNKLDOlHCz
	F084W9ancjpr0JAm2D69WeoKNAQogknLaTlm4expc/3xWwKSAQRXGeY1RhEWbrCrQjyHbUpZc2MbO
	xw/GjGFf0LknAvV9wZF96TZl3Q4MKVahx7SZhcwH3ZnUoE+uEb0VuR9eV4gTJPnHCrTBtRPnB5l6U
	CDsABX4F7jaEr1t1BtRw0jj+2JATt/1nAEetsjx7ylet/RoARU9xBJnIqTvhkJrKOLXmNsrQXR/jK
	Tv6UyCxg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc3-00000007tXt-2ePv
	for ath12k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMgMbS4015861
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qbJ0E6T3LBvjew4aO3Z1wvMfZiBEQELCcotF0vqyonk=; b=Mr4AHzDXT/gylJq6
	ixk5UyBjb2/uWLl8/QyVoNmZBRZ4/ewOVYNOaieK95VitriAsaci6CarTIqDL5I7
	QhQCLi1yNknrf3eawBfG7JrbHaDlJCtNn4Z4rq/08i1kpaw2FBeDD1bUHR/MswKk
	RpyBUsuCH37t4Bsy1k2iAmZD+nQDXuGAmEgZiTv3rG9MQkadalXIomNHyavsXavk
	01BSjeMk/LY7CWfw3+iYDoFh77+LSN2pcKvGq1ce4v1hpV4djxoiH7vCuM36eFUv
	O4gj3YrgW+GBT2RszeDiD53BPu/xlZXi2kGyyPnXY41XjwBynb0q+rc5pkvaHX0m
	zC+23A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq98y8ag7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-123308e5e6aso2880597c88.1
        for <ath12k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526810; x=1769131610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbJ0E6T3LBvjew4aO3Z1wvMfZiBEQELCcotF0vqyonk=;
        b=TlwnZw0WVZfmowfCwGE+m8ZfWVVoR01yrXjHvOh3XTLl1y5uazBqBiWgAYkn0HFwig
         MTPW7fXhIifZYeojryxm/ufIcpqk0HKc3hxrcag4mSSdHi7DThW45G64h3CWwoaPHFYR
         BQUurKNpoNDwd/cKoKfUCDk/oiudDctxRjz9CHdFiBIukHgpYrXthRsJgbCXrKPmtkeT
         lak+Xgm1oObVflae4EYN92HgggMnhV2cuGgaErNr5K15ohPwK5qnKfmwP697Iln/Vn/u
         oZK6sFmlYXIrER5tZwYGXhn8FYatDedkQfV5ARgOlrQRuv7WX3UwPZ9xY8GXXPaKXzin
         yyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526810; x=1769131610;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbJ0E6T3LBvjew4aO3Z1wvMfZiBEQELCcotF0vqyonk=;
        b=WJ90h0ap+f50R6vL7Z8Zmzp7IRAYbLV2UELHakyWvWWtD5eUUy+IOEA1EKmOqpHBfI
         vipGHwO+c3G4SgPUyj7veZA3LNa8mHxhDoagtFMW2kem7TjzHN5eJFIkh61xylLFzsdG
         Bk9Sn+8hOsBgaW0xpkV85Umcv2yIhpkW6HSTNq0zfTruP6T27zMiPXF/JbMFkFULBGSi
         +v77U9TOuI2GUulujdV5XCbu1+j20Ya1FVzGQCS9w4Jpoyd/ghkytlHPq3X/Ilx5qiNo
         9SIF8mB8r+yNZ4ZZV7naLgT4XxwAnUxq44RPPoFvxMEnY8oHVKkwOxd9khESodLERokz
         N43w==
X-Gm-Message-State: AOJu0Ywo1KiG8hoZADOoG+Au/qeN160LPDkLs8+CZySGx3r2Kbv069lf
	4zlynC9bjooJ3NOhURcxLBrntFtAodQDZNqe2XafDaNXOLTeYMyO+PILK0/z78Uy3laveV+NcxJ
	XZrWWa8tYcvHLPjkr5JtggDiKn6HsXRN9J5UolxoRQ5qervrwL9NezsJhcJWrVzI+
X-Gm-Gg: AY/fxX6G66Y2U+1gltpjgJ4eM0yZURLUW1sM0XKFsa+deZhzNJ5YmGFODsfuwEQJIq2
	JFh/vcezZzXgbwPlh7PQ4+b/QigJcNaFeKb51DakBYDlqfP80Doam+VZqnf3uGEyp/PaSolbZ2i
	y0zvB8kENvuVDKZHfrK/Fw/IpiHD+dkofiJ8y+qiidishm5+NejfQMx34owWeQYqQKNfDknrCGd
	2cUl17ibFOEM1U3ulQ/LXGdF1nFn4GqGNUFNydcZtO44NMDEuH2dZB9lMazxtR617/S32QyRLqW
	Q3HA1YQ264rHWbPSb9uA8JfkIY4WAgm6klHc6fmDxFHWwFkDoB/PAB9r+3Dmlt//k6bPQ4lUAzY
	1Q836dDtGXM60d/pdyejC3c+N35NXZS9ZGJPQV/EtpTMZHHm/Qrg/FGmIujVaqqvs
X-Received: by 2002:a05:7022:6b99:b0:11b:a892:80a5 with SMTP id a92af1059eb24-1244a6e0ceemr1558425c88.13.1768526810237;
        Thu, 15 Jan 2026 17:26:50 -0800 (PST)
X-Received: by 2002:a05:7022:6b99:b0:11b:a892:80a5 with SMTP id a92af1059eb24-1244a6e0ceemr1558415c88.13.1768526809722;
        Thu, 15 Jan 2026 17:26:49 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:49 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Alexander Minchev <adminchev@proton.me>
Cc: linux-wireless@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <20251127072839.14167-2-adminchev@proton.me>
References: <20251126170213.27959-1-adminchev@proton.me>
 <20251127072839.14167-1-adminchev@proton.me>
 <20251127072839.14167-2-adminchev@proton.me>
Subject: Re: [PATCH v2] wifi: ath12k: remove redundant pci_set_drvdata()
 call
Message-Id: <176852680902.1143034.13916014376553790993.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:49 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=FscIPmrq c=1 sm=1 tr=0 ts=696993db cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=nlFqCsrgqNAn5X4r5XIA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: FS5gdacUeU7_yZlpsDPMrSH-IVqQY1Zz
X-Proofpoint-GUID: FS5gdacUeU7_yZlpsDPMrSH-IVqQY1Zz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfX4M1hG+d1oLFI
 eYcCgOV/rzmOwVzGlo6tzTwNkDOB5dv8jKYCmRFkCHXuZQ5bNK8xwpR3B2aoNmcDSJm6NnpEm4T
 2c2dPRMnP9GeQhd+Mox/Dof6TMCN5O4sBi9PeTuSVztb8oKA0tpU+CtvT0aB7FpIE0Hg1V15IeU
 8sbgG8FOc0nsmvkLONSdyoIedJDkmksNtDMEAxSrS56KMO51iNYYeFKW3I3iaEYlxQHMDiVYUi+
 4NduLT8fb+39f7EsyV9lOyMoLpw8LWJrBDRI9rjeKX3nb7Y6ft5L3wdsyoPDPcKrwJNTUykVC1t
 urSFMvOmKdJsxmrpj/jbzehmO1ZF5vFwSbFevOG3C1lFmW5OjmXvYwWq3xQ4A0OyJ/U7GKMQEaW
 rKLMAwai0FBAzGAcyEJ57CRPRAus2ATefaDJsOzTBhBD8neV0JRiY7Ve/o1o8oFBNzZaJ6XjIlq
 q/FyV/EwQsJ4IyGm63A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012658_324610_65B9E845 
X-CRM114-Status: GOOD (  11.33  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org


On Thu, 27 Nov 2025 07:29:37 +0000, Alexander Minchev wrote:
> pci_set_drvdata() is called twice in ath12k_pci_probe() with the
> same pointer. Remove the earlier call so drvdata is set after
> ath12k_base and ath12k_pci initialization is complete.
> 
> Having two calls might suggest that drvdata needs to be set early for
> some reason, even though it is not used until after the 'ab' struct
> ath12k_base is fully populated. Even though exact placement is
> not critical, keeping a single pci_set_drvdata() at the end of
> the initialization makes it clearer that drvdata points to a
> fully initialized structure and avoids confusion for future changes.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: remove redundant pci_set_drvdata() call
      commit: 8fb264d1a0c5b3feae5f492ee2bc2997b71b63e3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


