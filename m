Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE61CA0EDC
	for <ath12k@archiver.kernel.org>; Fri, 30 Aug 2024 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAYYszW5xxU9NccYzBfKnyDR4cuCaW7X78i1OftrGDQ=; b=X7JzF0hILBFB4GBWWIebEsxjn4
	ZzopTKAEx/iUxilAGmxF0JcoUSvqKk36jsw1vAvd8akeQFiSeIY8+XqzujsLYQSb/2OvO78fFICIe
	xpKyHaQNH3BaazoApwwl4rOUfb6GXhPNuf/G+llsrYdVIRk5uSi+OnblQOOA5f6yh7qMPi0GIpfFb
	GKiNMKNtqc0lF6SdGAoV9/Qk9Su6blVdCpWSYEy7NM1u6mrwOS9PuT6aqTIUH2sg1Lyxb4Q6nWcqg
	SSiAzbXyvjfgdtTPTWQDukzc4NIWdTrWLV+GDE89P4si5iQQsL/AM3PZbGrJWiyAU3DeB9a46D6iI
	JNkc79Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk509-000000077Er-2khX
	for ath12k@archiver.kernel.org;
	Fri, 30 Aug 2024 17:01:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk507-000000077D0-06Lw
	for ath12k@lists.infradead.org;
	Fri, 30 Aug 2024 17:01:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UFZS3I002700;
	Fri, 30 Aug 2024 17:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vAYYszW5xxU9NccYzBfKnyDR4cuCaW7X78i1OftrGDQ=; b=PKC+crzKp0uYDK03
	Ps63FXe/QzBs/OUFcVfZ5GbzVijZWoRkeYqcOoE2YGuCAxM6iiOE7cpU9CPdxiSf
	lIokw+XLLTMQI/a6Z5WFPa+FEwk8Hz5V6X5MWCKBLqRG3j+T431mzFpZ9cQv34V8
	GpOrZNRjz7b0x8P2ukHPenjsjMZy4x9XZJSgc+BbNO5sM88YKNWMIqEQKoPPSMRf
	f00JnuPRxhCJM7NK4ZWQAOC2xN2YGgnyUJUG1R4DTmGSxuur+18XajHJ9dL4JO6w
	gsJ6UwW1yUuTGH+dZl/Q01OsI5vyADiiF449vThiSynXYMqFC8n+YEukfcMV6uZ6
	ROhyrQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puu1q31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 17:01:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UH1S1m021976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 17:01:28 GMT
Received: from [10.111.180.95] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 10:01:27 -0700
Message-ID: <72427069-d332-4296-a15f-5ef054d380c8@quicinc.com>
Date: Fri, 30 Aug 2024 10:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240830081942.3623380-1-nico.escande@gmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240830081942.3623380-1-nico.escande@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: TnExw-nTVxTdOB5SMQR1jKR1E5ZBG4yA
X-Proofpoint-GUID: TnExw-nTVxTdOB5SMQR1jKR1E5ZBG4yA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=866 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408300130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_100131_197486_2C8A8471 
X-CRM114-Status: GOOD (  10.15  )
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

On 8/30/2024 1:19 AM, Nicolas Escande wrote:
> Those two fields are used to store the per SPT page of tx/rx descriptors send to

s/send/sent/

> the firmware for cookie conversion. Right now they are in struct ath12k_spt_info
> which means they are duplicated PPT page times while we only need one instance
> of them. This works for now as we always use the first spt_info as a global
> storage for all PPT pages.
> 
> Let's move them into struct ath12k_dp where they belong, alongside of the
> spt_info array they are tied to, to avoid waisting a good bit of memory.

s/waisting/wasting/

> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-03283.1-QCAHKSWPL_SILICONZ-2

You can add...
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

No need to resend, Kalle can make these edits in the pending branch


