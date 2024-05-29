Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A047BC27C44
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 18:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3h5LPMKxKKDm4hq2pOHbFuVeCR93OWHOIZHAEeXxzg=; b=MtTtDyMqubps1vO/DYL1ztwGc1
	RO1yP5eg1rX1CD4twSzANT7IuEsRKNRtK1RFZpwaD9sRbxJJr2EqGGch8R8r5af/q3Ann32ugL71b
	2JZkB1/QgIvS7BZbbzr+hsZJ53nFPTRbHyagC84uvRIDnVFgqMKzLOL+3NWPOLmROPJLR6cQXvtnQ
	oK5Ww+JzG4g/CEHFAYAcrWIdSN7a/Sh7g/ZBjPAd4bJIM+UvgH8SpOqpqA2KLLbwYcq+Snf6qRI4z
	3sCrOGhxVn/yjZI4NI2vovQ3YvAZyxO/ZEsbqrp7B1GnO7lPvdv6dg4LzmHAE9Hcv3E1Lf1Y4HFLU
	pub8a/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORS-00000005G5C-1SLY
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 18:54:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORN-00000005G4A-3pOj
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 18:54:28 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44THtGYA006833;
	Wed, 29 May 2024 18:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K3h5LPMKxKKDm4hq2pOHbFuVeCR93OWHOIZHAEeXxzg=; b=IJMGQJCTlWc3n1tN
	kqqG59dAmEj6jeycC8+ergRvgsHnB3HZfT++0Xc8uOmdSa2qypxeLllj6wClpDWi
	UhmetA62yfT/bJsgVh0IipxRzRJtnnow3fHvu6bf6nOKQfwmkIvKDgg8Ip4w15hd
	4KYe6nkche3KIf60v7DEn2OaSol07xVXCRkhCStKL30q1Hq/zT8zIQBdif27mJbw
	RFuA1yUog0eNussdXUk8ZpAdJxpLABMYE/BB0GtbeNPjOvE0AlodgTB1N5I+QvF3
	K6V5AqaCTES6uW1SMztYDSmY+ztNimcLv5Ya3FKq6jSNkeW+Ktfd2+u3OPIkT/KD
	0/EGnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ye96bga4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIsOEe001990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:54:24 GMT
Received: from [10.110.109.163] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 11:54:24 -0700
Message-ID: <f62188cf-215d-4a4a-b9fd-c8cf9f87d6b5@quicinc.com>
Date: Wed, 29 May 2024 11:54:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: handle symlink cleanup for per pdev
 debugfs dentry
Content-Language: en-US
To: Aditya Kumar Singh <quic_adisi@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240529043043.2488031-1-quic_adisi@quicinc.com>
 <20240529043043.2488031-4-quic_adisi@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529043043.2488031-4-quic_adisi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pMezlylBW8ras7kBrY_6c6HjVU1-nV6z
X-Proofpoint-ORIG-GUID: pMezlylBW8ras7kBrY_6c6HjVU1-nV6z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_15,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=742 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290130
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115426_903700_ACA6C066 
X-CRM114-Status: UNSURE (   8.07  )
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
> Whenever per pdev debugfs directory is created, a symlink to it is also
> placed in ieee80211/phy* directory. During clean up of per pdev debugfs,
> this symlink also needs to be cleaned up.
> 
> Add changes to clean up the symlink whenever the per pdev debugfs is
> removed.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


