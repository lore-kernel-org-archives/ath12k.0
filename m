Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47DDC25B7C
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 18:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvE3R28QsUeJZMRGut3j6Rbqwa+5CyBjuIYBoUifLSo=; b=15vFR6RZ/zPmJsF2tj8sPDOy8G
	pmsgWn4OlnQDSWx2HdnFHT2B5VvB8G7DV4vgL11CpfJH8HngOOAXsv5cF/W4b4AerVg2FsLFbu62K
	GTaNrTALRS4SdDSIy3zMADOXmqPiwFac6MNycK26fu/aC/MUwml7SaXqMZhR9c2bPRnAv3RViDfGQ
	e0hb9i283/HhLwher8xZn96KBTmp76FHlma9au111Dk1AgpoJwpp6XcqWXbEaI/q2+vK9i1lu5pdB
	NAQiE1FuVqvPTch3yoKsof9GFbvm4PZR8HLvP7mV2DsL0qiqJ24CE4YAa4llGAzfTzxHCJQ/3olNd
	KxDzJ2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORM-00000005G3Z-1YG8
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 18:54:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORJ-00000005G37-11Hu
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 18:54:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TAWqrw027031;
	Wed, 29 May 2024 18:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvE3R28QsUeJZMRGut3j6Rbqwa+5CyBjuIYBoUifLSo=; b=XBksK+ACs4RGE8qR
	dC9stUbcqtTG45hgxUCrh+vgDIGtBvS9aLa0kUSo19D1JeW1S3u50gCc7CH+dHMl
	XZ2FRCgIASuZTor9khxvggIfMMKOC59OMGII8ZOiSP+nvsHXwNp2ck7pkZa3DOkT
	U/HShDEIWInXzK6c4+pIIIYNwERbO5qsm2OLmIcC1ZFw9SDf5AepQkP5KmOxMh+8
	f4mIsQguU7kDJdcteD0tuV6XusyBBY1MTGt1sFpqyO52Khw72BfrL2G9Aw1XuCZ5
	gDcVuRScF5Qb5H5pI07bV9Ov4VMZwazvLXdlS6+q+fpJEGTPf33mdHz8OiF5xs04
	7eXSpw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h9yvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIsIqd019529
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:18 GMT
Received: from [10.110.109.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 11:54:18 -0700
Message-ID: <45ce0913-a355-404a-ac4f-1f98c2927ddc@quicinc.com>
Date: Wed, 29 May 2024 11:54:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: fix per pdev debugfs registration
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529043043.2488031-1-quic_adisi@quicinc.com>
 <20240529043043.2488031-2-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529043043.2488031-2-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XSvmvqJHetAyGBSyJ011FkVUMVKQJ8S-
X-Proofpoint-ORIG-GUID: XSvmvqJHetAyGBSyJ011FkVUMVKQJ8S-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115421_344145_23A3FECD 
X-CRM114-Status: UNSURE (   7.22  )
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

On 5/28/2024 9:30 PM, Aditya Kumar Singh wrote:
> Function ath12k_debugfs_register() is called once inside the function
> ath12k_mac_hw_register(). However, with single wiphy model, there could
> be multiple pdevs registered under single hardware. Hence, need to register
> debugfs for each one of them.
> 
> Move the caller inside the loop which iterates over all underlying pdevs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f8bde02a26b9 ("wifi: ath12k: initial debugfs support")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



