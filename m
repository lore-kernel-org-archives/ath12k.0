Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE139C02183
	for <ath12k@archiver.kernel.org>; Mon, 13 Jan 2025 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUOLFheOXaPn7vxOSNO6EuwVYDmzYgNLEdqYuajMpeg=; b=jXORGxZtBzYPeagaN/kNpR1yF1
	yMxfnH8UPaQ1fnQEKGKSIRntH8JellWrtXMs9TDwi4tbDOwqavmHXI675jIKraf0I1Ir5/GQ5mXX0
	pzAjs1X7jQ6upQ1ixRJMHnSbcwTk1Sn4Nppn6ktVRPIm6z6P4eGufyhHpR3Fy27ry53Fo/oyqAgOp
	+3ioHvzkOthzcKnLHG6Q494+R5bunysFVVbzl6XfxmkQfe3Ep3TmEz8xdpCiWeMmpr8WFpnwA4yw2
	XHB8VncL/4V1IX/Bg6ZsMVG4Epn32g/p3j/vKL7fmPMPolPfB1uIs8LIjpFXcHBGzwDbXMQokKcas
	drskzJ+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ3M-00000006Mxb-36Mu
	for ath12k@archiver.kernel.org;
	Mon, 13 Jan 2025 19:24:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXQ3J-00000006Mwb-3hPm
	for ath12k@lists.infradead.org;
	Mon, 13 Jan 2025 19:24:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DFS2nV023216
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AUOLFheOXaPn7vxOSNO6EuwVYDmzYgNLEdqYuajMpeg=; b=RR4OFbnroBM5qm0E
	p5NRoCQU7JDSJ5SXIFrd6rPqk3APLAwxMchaBNeGPWWT4sGlUjCMC6VZqtd7XX2C
	A2wcRfS4RTOUnWHBrRqlM1pB6PlTnClbWKPf+AkXfIjGevMke1y251dKg6kqejh2
	LbTdb+79bw3wrTGzBwZATiiosPV5/7yDE5yHtCNzpYBEhlcFOdQKq2fUQ/o/3Gqz
	9XG0Los0HPVqvXeCZNbXrtCpZ3EYwrPJxcLuxuyqigZ2+XjGmXibwDudlZXAaZVj
	gG7vE2w71YkJueQugEpQrQ7Z49S3O/WAnGv693A3KINBlJ9RY0fwFJyMGYzIvsu4
	4+GwYQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4455gfrke0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 19:24:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2163dc0f689so119430025ad.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jan 2025 11:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796284; x=1737401084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AUOLFheOXaPn7vxOSNO6EuwVYDmzYgNLEdqYuajMpeg=;
        b=d2po4Vwd8VHgkQmjyMp7PcdbhGwwPX8KAMg5PfvU5NOg2eY+/F7g2n/NnWSXVSVdtf
         2Ck+9qxLZTInZ0921q5jr2gbmfSyfAYsl3b/36iKEwAY5S2hUMjVCc1pYJbBPdpv7lmB
         s34AZZAxUfzwzEwlF2GOizVvhEM8vyPXErg7HoPcQMjjGCuWgSwLP2qzDu6GvZN4Sxwa
         L81TNkL0z+6uPf/j2tIxUvxDqrDI1qktZ6CyyXwHxQ5K78WbypJYoljsUrdakWAaaRyi
         2+jSh3UbRJ10elwh/p+iIz+bNgwTmTsGUSz5aWcbUw3JYbsMPmDDO4v3aSqCdfxFZNHH
         /sYA==
X-Forwarded-Encrypted: i=1; AJvYcCX0k8ooFc06nOtu3RxIgZO4Om7l3Q5UNrg9lIr8LaLa9ennKTA8SEuEoZ6KCyl7WUOwpDGRbK8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzE4qjB4piUXJZA3EggdpCb0GM1HzdrOAUUIGQVbQElFkj/6kV
	X98Jqj0twUkdbtQPyUtVk7NHV5tj20F7otDDVxTlEiMlj+HvjUg5gR7kA+kFa+UbVIEfXeGqu9O
	W4lqRZOjv2tRbPMrC79o5PvyPQpu4VCYxcsoIL9Zlnlnl13+SN0NfLwzYroYR
X-Gm-Gg: ASbGncsCOf8BWCBT9d07ZExXobkeuI3FI9ewzWbcYreNzh+UYaq/HDe2LsEG+5XlXKb
	82SFA+Cwma86cIZMNsgj/fGBDg1GC2PxmetwiwmTfjqRRRRd5lHV+fQOAwKMDfqtAEo2D0gKyUx
	mxyw4r38NbckrtHLYLKQzbJODrwhZiFZk1uPVAUDbFGfO9b25jb71Saih3n5Yei6S3NRBrzbl1P
	HzPzUn37//3HmnhzLTuyvoN0Ed80+WWw6UHekYhUYDCAal9v66n2Y3lDkeAlVMXGs2gJnLGUdzw
	aRUUcvBnp9T8NlOlgGguv86+L0fGvdNPnLHHK5GU8sNFgNCVCQ==
X-Received: by 2002:a05:6a20:841c:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1e88d0b6d05mr38830006637.30.1736796284332;
        Mon, 13 Jan 2025 11:24:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmceM+8RgiF0n8czYoLDHjbC9BgEP6OqgjVvqDc4obk6V9Mr5uL/MP3NmNz6OUjD3DEuWoyQ==
X-Received: by 2002:a05:6a20:841c:b0:1e1:a9dd:5a58 with SMTP id adf61e73a8af0-1e88d0b6d05mr38829963637.30.1736796283924;
        Mon, 13 Jan 2025 11:24:43 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a6b4sm6405859b3a.60.2025.01.13.11.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 11:24:43 -0800 (PST)
Message-ID: <b3773859-4cb4-4d8c-aa61-fb227fc22bbd@oss.qualcomm.com>
Date: Mon, 13 Jan 2025 11:24:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] wifi: ath12k: handle ath12k_core_reset() with
 hardware grouping
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem <quic_hprem@quicinc.com>
Cc: Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250109-fix_reboot_issues_with_hw_grouping-v1-0-fb39ec03451e@quicinc.com>
 <20250109-fix_reboot_issues_with_hw_grouping-v1-9-fb39ec03451e@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109-fix_reboot_issues_with_hw_grouping-v1-9-fb39ec03451e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LypS9x-8v1IAydZerZoSviyKB9loQRHK
X-Proofpoint-GUID: LypS9x-8v1IAydZerZoSviyKB9loQRHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501130155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_112445_938383_DC878C45 
X-CRM114-Status: GOOD (  10.76  )
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

On 1/8/2025 8:25 PM, Aditya Kumar Singh wrote:
> Currently, in ath12k_core_reset(), the device is powered up immediately
> after a power down. However, with hardware grouping, when one device
> asserts, all partner devices also asserts. If there is a delay in
> processing these asserts, by the time this device powers up, other devices
> might still be asserting, leading to an overall recovery failure.
> 
> To prevent this issue, ensure all asserts for a group are processed before
> initiating the power-up sequence.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>



