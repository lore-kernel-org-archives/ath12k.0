Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1CCCDB479
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 09:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdEudFNNt6xBTGu7wVRxNGhKKMAcyea0azkIR9tHKYA=; b=lsloF+fnD6F5qiqVSpxpHrFZF+
	fg8v9LePPhwmCGJTwiCaRwtK8Nws9nD1YFJ7AL+dljdrCqdT5C5VNiuXFgf4w8SAzSTTm408wYr2z
	FLNSvh0IEMQswJbAgjpdYS4+euhe3tkd/Nqz3qmz9zqOahYtuTN1AvtoxH6X5Ah8IPlAM9Nc+Xmxp
	BjtPnDO3Hj3ySC+cPt275bfS4F+fr4tejraH0SmPqc6u76++dnq9QW89B01otczTBKFifIyA0JJSB
	ot7Ea0KetBWV4TNafzOqQym1YV6H23Wh7+Y0NPe0aB2jyiqv4pb/6KTiJFjMXLncUHdkcXtahHSk1
	nMF/BE2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK4m-00000007WbV-0Ke3;
	Wed, 24 Jun 2026 09:39:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcK4i-00000007WbB-3FNK
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 09:39:18 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O7FhNe2439230
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AdEudFNNt6xBTGu7wVRxNGhKKMAcyea0azkIR9tHKYA=; b=nsjZOmHaXZktUH+f
	ritX62w1PqVVDGVWaqI89vNxIf5QVzqljnls8YiOHMM1Xml13r/YO9hdFcXKPJNi
	LAWSdIZmoqidm3LSUjgTu/PwotCq9ZEkfNzQPni6VLTELI/tZvZLWKDbOZLTV97v
	niSsfeXlw7K31tlJB0IUVGv+XBG/KHe3XDw2XATi6mJhcEAz0jmmSED8SU/SREBw
	WJN2CthT+0OJD+K+7IcA2Vz8ca4LYgVKHvSEBF1ng2uk7D5n8mbs8Iqj/IYpIG6A
	Re5QvEPAfLkgkz11V6AmtnBC1KMuW/CVe0LxrMFNQA7bvTlfDcS37f7r0eqiD6OB
	K8Av7Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0apq0gm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:39:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0b35fa876so9024075ad.1
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782293953; x=1782898753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AdEudFNNt6xBTGu7wVRxNGhKKMAcyea0azkIR9tHKYA=;
        b=GXk/YqO5c2UN0lfOmDDh7SOp4ViubqJpJ8w6IvUKZInkI9DEb82nhG92mq6tRDmXZr
         ftWR4nZpGce8gKsOaaODSK+kH95fEqaKGy+1ywfRPJTChv3aTeUiZw1J9ezJo+EjLfRp
         Jbqo8+c0GLhE31IZedu/9U10dBYqEQ0R/H0Kc4aXHjnoDYY57cI3bsOSeA7tmDGViztY
         Kn55JYfuppuaYMB9Xge9ZEEvqAY4abVQ24sMQUOW7NawaEjzJJnn2BUOZWyegxbbGlhu
         WxLyB/Hzwe9yfRDwOdYC+owTkYG2ETyWptVLjhQI4OCeegrJFT+X4GYHqQ6SWl2vom+j
         4XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782293953; x=1782898753;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdEudFNNt6xBTGu7wVRxNGhKKMAcyea0azkIR9tHKYA=;
        b=pdw7n5vLKu7iO3DM3z+6dbO8MwCoVUbj4dDNP1AgIMK/Ls+bdHwDp8h5Kvmzpha59Z
         lrx7d4Xexv7UXNCI0Ia7mEc0aigXhxupdG3HTqKLPNDANPTLAL8NEshJaVB2gDd4qJg1
         Ot08VcBTpGVsKtSrRBQEKlbRoL3w3hm5TYZecGwG0amZzghjqf7gZnHXVycrRyI1Wzvm
         cHXQkcSfJ/mUxyJM189d2iHsodPzdskmpWchK1FHvFfAcoY81vZbOqqx0VF1VdWXmdNg
         ruHEwVcrRvRyfC5k8SD2s0H+ngg+BnnrcJWSJw7n+sCImRMa7sjBNYgHVrxHuRpMgMmE
         PeFw==
X-Forwarded-Encrypted: i=1; AHgh+Roe4LMazJAtPvBD6ZHxvyCGW0gB+t9OHsFUeu3svONtRKC19F5dOl8vLlYzBIOq5v1vDl0RmXo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzShwnl40apAz/wjiZ9tOijVtFuCAwIjeP7k4MNkuG0E12vs+kP
	kMnQeaKnmpo374ye9veFsqVKLThKh7/A/6vmdA6c6WT0VZd61tWZfeerRzUEUAdz7l5fTww24Ya
	tPiRaWvrCV2secTZ5FZJ6CKKjompRv2MlNn4rDfKIsyPlAKn1CEM/yBa7T0vljEDW
X-Gm-Gg: AfdE7ckGlXBSEHXOfxI6VsBzVICpUCJhElZHvt8gKkcAewjspUrV9RYxlhSk4NPMPoD
	xKOHLWgktlzMBDeBZbmh/rzjsZ/tWA1GveykBCk6yWEINKDZMwfQlkA8E2CubH3zSnifK5urPlH
	btVMz7v0I4O2nTYkEI5lt2qvdXlrjbJRUEsk7/5FRw0BNskoTIehev1fVyUhBDYOmVm1NZt67aJ
	VImW/XPkyYWDq8dm5cllhXfx37qkKt14H9mJtK3yfraD+lUfwXuZnrfpbpQJukPO7Uq+SuX2MOx
	+Myvwmwma6FDu4Hv2dA22s3/c4eF8Yx603GnDkFOOwHDF0Yck3UoB06ujjrW5/S4QYTke29lBm0
	E5RHiGbCLYuuQ+T+h06tPs2vXBy4OUQKvAOG+em3sUuVWCAoEjtXrwIwFXeJDxIYfXd1C1EZwO+
	P2HWKHBA1+
X-Received: by 2002:a17:902:f650:b0:2c2:dadd:940 with SMTP id d9443c01a7336-2c7e13c0212mr29602145ad.2.1782293952750;
        Wed, 24 Jun 2026 02:39:12 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2c2:dadd:940 with SMTP id d9443c01a7336-2c7e13c0212mr29601925ad.2.1782293952284;
        Wed, 24 Jun 2026 02:39:12 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444a9c5asm124861435ad.74.2026.06.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 02:39:11 -0700 (PDT)
Message-ID: <be02985b-f8b4-464b-9097-d46f1fd32349@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 17:39:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use %u for unsigned variables in
 QMI debug logs
To: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-qmi-debug-log-v1-1-79471aa8b898@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA4MCBTYWx0ZWRfX4LYl215dI67y
 I7pEwIjmD+Em0fzBY2vvONKPI9p4KOxwFUfI304z3MEfORcOJuOsxcABCwYQ8CxD/rAYiGPIVt2
 eqtb2cxVJmu7T5Ih85dyZrdnnXP6Byg=
X-Proofpoint-GUID: PCONVhNxDdv8HhsI5liqzOlk3MVkYVJk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA4MCBTYWx0ZWRfX2oL18k8h/bre
 /L9E3AheCvisaeiUDq8fV3N+LEK2UZDF5acCYfi9mcaRZFhmU59TWVjpDI6VtY/WdS+gHgdrjnU
 y60sobobysaHsbBrSCbMafOOg4ymSfIxlgIQIdZcWtcl0cW29U5YbEIzQtrY5jhxFZGqnzf45nm
 YHHrnJLBoNEzFvor7rXMxBPWY/leuC4nTtc7wTMEAUTuLNJ9FLCG7GJQIqjVMwf6nj8yLo8HCLR
 bxOSakWg/YZsztvEQyu0kge7L+qtwb+xZG7vB7t/zpx3IRd7KW900zKj8w7hrFdqnIzX+VMHNbA
 +RXgTT+DMdqGMLT34utFV+e50T8i9TWwgag3YPyQKSLMdlcbqt8INaaVZsV68AKZtn0YGg9YGNq
 oTZkIMsFlrczgBjS/FSRUwkGGbqEEg==
X-Authority-Analysis: v=2.4 cv=NpbhtcdJ c=1 sm=1 tr=0 ts=6a3ba5c1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=tGGASSKubhSInVnLuO8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PCONVhNxDdv8HhsI5liqzOlk3MVkYVJk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_023916_949980_C791AB58 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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



On 6/23/2026 12:04 PM, Raj Kumar Bhagat wrote:
> Replace incorrect %d format specifiers with %u for unsigned variables
> in qmi.c debug messages. Also add missing trailing '\n' in log messages
> to ensure proper termination. No functional change intended.
> 
> Tested-on: Compile tested only.
> 
> Signed-off-by: Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

