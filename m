Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4A5C369D3
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WkJj55ckMkZWRebTctgmjjLQ0yNC9NwyhJauRBTO9A=; b=SgrTDCZpD1h0Kuhwc+bzOXSYxq
	yLgPXlpMSYhQPay4fx3MfC6YBeMrNyIrNoE/EKocpMSUARmcWpgZgWI9zUNrEY53DggxGR3h1emO/
	ueEV+jkW5AA1apSgtvWhT3wkp9G5CcD6L1B4LNLDmafy0speBfm/GFdPA9ZM9nNv7RDwTO3RV56LR
	xkX+suyp23TskatrESIqz0LAXGlJ7W2XsZImAq4xdPIb4GP1VJFVGCVjotS/RoQ1HeDXu6mGZ2BVh
	bD9HHnPm/NKXJ0AYSz4z8oBwtyLx4003P7GI7vy2xrRhIq44AwkJEYR3uFO2l2cRW6z9NFp8AE1uN
	ciWgsywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB2-0000000EVXU-0MS1;
	Thu, 17 Apr 2025 22:57:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAx-0000000EVQl-09p2
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClTrr014422
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WkJj55ckMkZWRebTctgmjjLQ0yNC9NwyhJauRBTO9A=; b=FhiTwbvyn/c9WFdY
	ZlQSMVBxHo5g0B9pUGUrNzK6d7IREXiqmVg1eyZ1BE3PXDhDz+RlL+s9yvdlLRU4
	L2vphNxBc6mVND1wwAyQ8Bj7jfoaTzD5c8LtSjMXFaQxo9wjbOZ6fIHME7z7GQnk
	Kp/smCah4MiO6GXWR3JeWiIzybKmni46ziYvb45mvvFD+akUzFeWKdRRzubiiYJk
	SSsDN1vAO12Y/dQ9jS1LbBDggzl83VZyrqFunPLIRgh7hcu/5hn3/DoEEHujen+H
	zw8YrgOV53jVqdvXH0ApahUxZGsRGdKWbWs9TsanDr8Q7YxR8Gl8s8SGbU8g4eVk
	IbaChw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1g9m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736c7d0d35aso1715483b3a.1
        for <ath12k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930661; x=1745535461;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0WkJj55ckMkZWRebTctgmjjLQ0yNC9NwyhJauRBTO9A=;
        b=MJ5WlG+eE2Iws2O1AmK4uOr//QiukP0NITFeIXg18ASCn1eIo0st3C/37PEXxtsPMy
         uC5/0jHVorw1wsn3UaEEs8wFxoZV+UH9/WSyCbx18kp0DdY0jlELCz/ziQTj+01MhW7a
         ZHrXRDNu7erESPmPH/RysQDS8QQR9xAAgh4Rxsn3XXD7tLW2TSAocmgplAGf9lULe50b
         t0/Ju0mlxhMyzvWiyvzPtJURHogMGQH8unXEGnUbDeqYtwwQbyuII0AF1T58lFGI2/r6
         mfY4E3K3UbzB45YoHPaiVhPf25l23zsjbhVZEMDxCYShY+HHc/+jXKFWbjFrG2m1o4pX
         9GEg==
X-Gm-Message-State: AOJu0YxlWHq/V61rWZd93AcihlSLFUx7Ygn98BRa/PzsVxZr3ktMuQKs
	vm8VXzz5dgdN83DC+vDYR+F/4hxgLKR0UnZ0Qs2aaAwQ6sp+XlIfaahvcFeLaKGebQ82oJEGYgZ
	3zb0XYOdXYfDCXlnv7Mt2PYZ2Non+onS4CSyxDHyu6B7fg2WhwJN8dxUcOjFR
X-Gm-Gg: ASbGnct/BWZFF7ecZDn94dtIXnkFCjqpz4jhR+w8BATCKsqNe+kanVk1TVAG4po5S+7
	6aE8ahYRK5akLhDUk6OnIIhqlErbZFyGpPIVcARkkt9yiz0EV+OG6Knro0wij8DxmlDY54pGpU7
	/ftVs0Udvqi6uhNCQ+7pa/zx+jj39Y0Ilm9u16o+BrtnAeJG9OGjJTdh/IATJs3MuuJLaL/FxqW
	9Bt6nQDCbuJ/J8KuOhtSo6iZfDl96bufJ7pKYy2wohmBMFQzBARoRALpOyQh//cJMjV4ZOKpTZn
	eLBaWrKpcMr+hd7ruTFcCkV5MlB+uPNOaoFgBNCvEQPzNVIo
X-Received: by 2002:a05:6a21:9186:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-203cbd23855mr1333900637.35.1744930660778;
        Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYDbzyzQ4441nOFlGbZPBvia6ZjBBUvo5HhRIXaGmnKFkpUhiOGQBk+8HrYB1pPWXxScFyMQ==
X-Received: by 2002:a05:6a21:9186:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-203cbd23855mr1333879637.35.1744930660364;
        Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:40 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250416020414.2161545-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250416020414.2161545-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Prevent sending WMI commands
 to firmware during firmware crash
Message-Id: <174493065977.1347382.5338707577981536248.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:39 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68018766 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=JeHNsM41ab7HFODXWO8A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: xQlCMBSXO7BtGhKRs-70MNIP5oYBbUWw
X-Proofpoint-ORIG-GUID: xQlCMBSXO7BtGhKRs-70MNIP5oYBbUWw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=848 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155743_245068_C664B9B8 
X-CRM114-Status: GOOD (  10.33  )
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


On Wed, 16 Apr 2025 07:34:14 +0530, Maharaja Kennadyrajan wrote:
> Currently, we encounter the following kernel call trace when a firmware
> crash occurs. This happens because the host sends WMI commands to the
> firmware while it is in recovery, causing the commands to fail and
> resulting in the kernel call trace.
> 
> Set the ATH12K_FLAG_CRASH_FLUSH and ATH12K_FLAG_RECOVERY flags when the
> host driver receives the firmware crash notification from MHI. This
> prevents sending WMI commands to the firmware during recovery.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Prevent sending WMI commands to firmware during firmware crash
      commit: e9e094a9734ea3bd4d4d117c915ccf129ac61ba1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


