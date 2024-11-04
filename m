Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9639D132DF
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gzKW2w6+lRVDrV6jRlI+WcrN4vRWHQhDRGxfD3GANQ=; b=tY7XZ5PYXBk7lU5MYCPjMG0eDN
	0pYZN6H3EvJLKzPyDWEH4mARpkubd5aki5K+Ij2NBdN7fc2ob1wjs7Jqd2qwjQaFP8RPJwrRZWwgT
	3Opaa3m7Acm1S+GygV6WYAPWofQr7TPwuOtKN8dvSxta5baQ5y3Um/8VwcokF2jY+ICHKqQGZ3DE+
	XABxRbFl6GUBpavozAd5rkqAUfAYOxRxXitN/pp5ar5n03jkgnw8fRoWUPboa7d8Pj0neCMl75uye
	4Q6NN85yxraJOqCOjSvH5HYUSPOxfErqDzzDxRw8p2vKaCPm9RVGs16Us4sh6+hus4KXmjVBdI53m
	D9TIA60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zFj-0000000EFTQ-1zE6
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 15:44:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zEU-0000000EF93-2lj4
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 15:43:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bu4sG028042;
	Mon, 4 Nov 2024 15:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9gzKW2w6+lRVDrV6jRlI+WcrN4vRWHQhDRGxfD3GANQ=; b=B48UBxn8aIn6lTv6
	43V170guUdvTYyE0xoHReFldTwMQzEaH2eJGsL8e7kiSbDpG90CDpnpJQ29SLdnv
	RftV6PbwWApiSqJlH4HAqGPE4qv419F1OvcuoMjVDyiHtt6em6mEQFP/19tR51ft
	kU8eNODOwzpgaKD9oKO0foqr2xtSBvzEsB81C0Stu89d5YPgDIMMj9pXHIkGRZll
	8FDX/Zb6ZRqyvjUi8bWo1mWTwsFrS62LpzuUM50ANQRLD10Og0OVVNg6pA72+mh9
	xJ1NYHJ9ShNLo9Y5EoNXylZ9PFTy1sjFEumSU9UPEwzQNxvcINV7aHIIVkIT2NlW
	W4yYTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42p5ye2tmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 15:43:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4Fh4sH011730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 15:43:04 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 07:43:03 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k-devel-internal@qti.qualcomm.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>
In-Reply-To: <20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com>
References: <20241028-ath12k_qmi_driver_event_work-v1-1-0d532eb593fa@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: mark QMI driver event helpers as
 noinline
Message-ID: <173073498362.2435998.11227075604686826531.b4-ty@quicinc.com>
Date: Mon, 4 Nov 2024 07:43:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Dx6AFyszWS8nBwhUKUyivxqrNZZ1WWdv
X-Proofpoint-GUID: Dx6AFyszWS8nBwhUKUyivxqrNZZ1WWdv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074310_737666_6BA4EA6F 
X-CRM114-Status: UNSURE (   8.20  )
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


On Mon, 28 Oct 2024 07:08:40 -0700, Jeff Johnson wrote:
> As described in [1], compiling the ath12k driver using clang with
> KASAN enabled warns about some functions with excessive stack usage,
> with the worst case being:
> 
> drivers/net/wireless/ath/ath12k/qmi.c:3546:13: warning: stack frame size (2456) exceeds limit (1024) in 'ath12k_qmi_driver_event_work' [-Wframe-larger-than]
> 
> Nathan [2] highlighted work done by Arnd [3] to address similar
> issues in other portions of the kernel.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: mark QMI driver event helpers as noinline
      commit: 07826419700d4e7429523bbb4e936df6bca19c5e

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


