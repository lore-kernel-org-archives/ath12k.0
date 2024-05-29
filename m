Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40599C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpSIB8zCMPhZJXXwMsLR0VEaQGYpFBGechwVjwXrKG0=; b=disIn/fck7OvlCr5i9hv5RFxXp
	QF6zwhr0xZNkFFcfkFdkM3CxJjMlWVQJD9M/5o7S9G74gxhMMzUzK482qpi27usSbqCDwCb0TzQ5r
	cYxb+UUCALhNSKBOjISWHAmsPmyYz+WVj63wq9PGcz9HHXznsdIicg/9VdWdeYJcoveqUx7VHOf77
	p8HUUuBCI5HhXRZ7+q5aYjEezItD6q0o/fpBpSGPzACSztPWAPmN0KVcEpbFoVgu2EjGM0cQ57L44
	xwbSOWx3zvkzGbU/A0D5MYWfgbHQqvFzhTTEYptOd5oxm7/0YKsyi5GSflb3SUfd+fjEKlVmZJ2Jy
	s9ekvNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLre-00000004r07-3vYv
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 16:09:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCLrc-00000004qzj-0cZv
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 16:09:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAuJXM026856;
	Wed, 29 May 2024 16:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qpSIB8zCMPhZJXXwMsLR0VEaQGYpFBGechwVjwXrKG0=; b=eHb+L+UIGUcrkTBB
	GRi5KYBCe9LW/6y9lPKo/KxNhIl58ln+s+I02yWTc4vWIjQD3mHnPhutwav7KLFg
	wggwvWtTpAKJBGRy0eNu639NubTyngRPAR7TLJmkFKN+HlwtMvVQldMKFBlwtbjy
	EyAz1mYYJnLRCcC68bmIPbnY5FPmTViaKyCkvF/Bl2VdvhH0G/NgMPPRdilXB9N7
	YX9x6hUlF6oP+u4fyviCP/WGNE8F3IiQEGTAVt6cslIRbpZgQ88YasHdqQf1mu/q
	NcS7fQitVX+mas23adU4DQG1+P1+KZUIlcPclIdYBGfdfGCs3LtVpuDbzgdT2VQ5
	WpQiow==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba1k9f36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:09:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TG9IHZ002158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:09:18 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:09:17 -0700
Message-ID: <53fdf634-ab24-469f-b4d1-5e9a8c9c113d@quicinc.com>
Date: Wed, 29 May 2024 09:09:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add panic handler
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529021533.10861-1-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529021533.10861-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FGvNPL1tMdWnwX95nP9YZaYnsPs2asg3
X-Proofpoint-GUID: FGvNPL1tMdWnwX95nP9YZaYnsPs2asg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_12,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 malwarescore=0
 mlxlogscore=825 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_090920_228057_F278EBD5 
X-CRM114-Status: GOOD (  13.66  )
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

On 5/28/2024 7:15 PM, Baochen Qiang wrote:
> Currently for ath12k PCI devices, firmware could be running in one of
> several execution environments, e.g., PBL, SBL and mission mode etc. Among
> which PBL is the only stage where PCIe link negotiation could happen. So
> normally firmware runs in PBL in order to be enumerated during system reboot.
> 
> However it might not work in kernel crash scenario: ath12k target is not
> found after warm reboot from kernel crash. This is because when kernel crashes,
> ath12k host does nothing to firmware. And during warm reboot, WLAN power
> is sustained. So firmware is likely to keep running in mission mode throughout
> the bootup process. As a result PCIe link is not established and thus target
> not enumerated.
> 
> So add a handler in panic notification list for ath12k. When kernel crashes,
> this handler gets called and tries to reset target to PBL state. Then PCIe
> link negotiation could happen and target gets enumerated.
> 
> This change applies to all PCI devices including WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


