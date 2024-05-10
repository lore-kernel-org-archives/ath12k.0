Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836BCC10F1A
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r9gKm0Ajz5X1tmDVy2x/04MjMN6iBNq73xhX32dIXk=; b=Wbvq8QNzRcueqdsFti+OkEPdIF
	D+p+f1K6Y49uRDKI6za8xDsSPz3P28AujedsWXb3gaTQCJOrQHuo1KrsvuZVfyPLTivkogxl0iQOT
	ep3f37N2lysGoYu9H6zi4uC3TZBfO3JVuSbojxO8qtguWw6TtxR1OoHWo4h+utEkVy/tDiIJ+sYI6
	rmK98OSj+JgYY8hI3llpzGORLfLMZyq3gXMXnZsVG6CMzxd1wTJvUY4A20qEXPLxYitSkJ9o9hP+g
	+QdCdEwZfd4ZCclV+ZhgglNK07rNkKp8QRh8v6l81ljcL/5h01eYtPXVHnIaEExdLhp0pcECcnXLB
	LLSMdPSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FpO-00000003ixf-0n8o
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 02:17:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5FpL-00000003ixC-25cn
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 02:17:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A1B6Ik000724;
	Fri, 10 May 2024 02:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=7r9gKm0Ajz5X1tmDVy2x/04MjMN6iBNq73xhX32dIXk=; b=Ro
	ejC2XlxD2ySaeNXIzF760VpQxKzIZRLwDINTkZcBJtprmsIzjEwWngEp+kvnhbnx
	DnSkNv5MGwmrj/vIOgdwoKZCfeL4RjXVh+GClrHFF47rlrW84TRv2XgrOsLoFkK3
	fq8GECtHQwiOVkFKpCPz/RNVnKZGr9GR/G0Xc5ZA0gWYMkntP28DRxyu6HWS7TuM
	AMtOKrQIuB8WPDDLyBTwZNtVyT7ZTCSAkkNIfBHNF7zfjVE1xBpmtQ6DcZ3xKHpJ
	tyR5Hsn9uRgvuOOfv0MwbHCx56Wtg+Qqm3+0tJRBBk9ENUbkmAlWpUe1Ox0QLrv1
	P9HQHhiYBTW4JZm3cv0A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w0rbne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:17:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A2HcVv008845
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 02:17:38 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 9 May 2024
 19:17:37 -0700
Message-ID: <eaf65a38-2e56-480e-9e05-2fc2a36160e1@quicinc.com>
Date: Thu, 9 May 2024 19:17:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set
 to mac_register api
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240507045702.2858954-1-quic_hprem@quicinc.com>
 <20240507045702.2858954-6-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240507045702.2858954-6-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WjIXjCf14SjrKD2_jHnMb2nzyuo6EVC0
X-Proofpoint-ORIG-GUID: WjIXjCf14SjrKD2_jHnMb2nzyuo6EVC0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_01,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_191739_584234_9673677B 
X-CRM114-Status: UNSURE (   8.22  )
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

On 5/6/2024 9:56 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> When hardware device group abstraction is introduced, in future, a group
> abstraction is registered to mac80211 rather than a particular device.
> Hence, setting ATH12K_FLAG_REGISTERED in QMI firmware ready event might not
> be ideal.
> 
> Add changes to move set/unset of ATH12K_FLAG_REGISTERED flag inside
> ath12k_mac_register() and ath12k_mac_unregister() respectively.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


