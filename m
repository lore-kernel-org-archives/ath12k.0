Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E57EC47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Sc1LEpPA0gvd9nYJBvnk1pRSu7b2qnwp1qT1oQfiXw=; b=vOvmiWflLs6NOcDXClj5uz/MgJ
	MsC9tyv12t/CtyhjDGSQDN6kUJF1/pbAY5mVCgBPNUgaJFP4ePA9ysbeDYYa9OI5KOOCRse1dM3eo
	ToclXzDM9BKAtHGGJbe1zTzNiu+Q4acLNriWRPe24Qeek+tCjW1xKFCmhKFuKfScEtnJ4aShP5rou
	krlqHlX8/yHSOAaP7nDui/vQmNCFxFERCfoDk6TJSYrO8qf35e8SYg0Pk7s75L2aeVCTFCOyGYW7f
	dQmr6aoRrurxksndN4/ehb7k0vSyPpXu5hcv4xhEe518RFv90HlbbZR8pBrDDQU2Gd6hDozCArDwq
	SoJRlRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHof-00000005RLL-39kk
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:08:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHod-00000005RKt-3I7n
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:08:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKEijO011973;
	Wed, 31 Jan 2024 21:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=6Sc1LEpPA0gvd9nYJBvnk1pRSu7b2qnwp1qT1oQfiXw=; b=fV
	YCc6xzOH/LAD46txQ03dfQgTl4PY3P50gVYtwuA+ONMbdNtJAVuJ9PNK8FLCC15y
	OmaBVysjGgVx1QvZhhAjViDl7ITeAJBOhl0wDBrNehzPgOpH7MO6ewf6dSOFEIjx
	g4fc9Oh/VsF/CB4oE/YHcdnV6mmIEODESr/3g3PzOSPHGwWFgOiUDE6zd9+NgxDU
	qzWc8Cwcr02dP8/MIIt6JMtOPom2b6jCHegz/dojcZHGtSiDYf73pTqDMLzhZeo9
	MuIKx6sCSQzZGe8xb9/vfrPPVTvTRSLROJ4XP5mUJEPzI2p7fYHdn+jLU/xOKhXa
	y4fLB/IPmCCTYCevA1Wg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyve607m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL8Ewp024691
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:14 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:08:14 -0800
Message-ID: <eba9c004-1d9b-46ef-a5a5-203d741e9c17@quicinc.com>
Date: Wed, 31 Jan 2024 13:08:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] wifi: ath12k: disable QMI PHY capability learn
 in split-phy QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-14-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-14-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SEXYqHKGyE2VoBD32vP7mPr6ksEbcTTc
X-Proofpoint-ORIG-GUID: SEXYqHKGyE2VoBD32vP7mPr6ksEbcTTc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 mlxlogscore=945 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130815_863174_10DE6430 
X-CRM114-Status: UNSURE (   7.82  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> QMI PHY capability learn is used to get PHY count information to
> support single/multi link operation (SLO/MLO) configuration. The
> QCN9274 dualmac firmware currently do not support SLO/MLO, if two
> PHYs are within the same chip. Due to this firmware crashes in
> split-phy QCN9274, while bringing up AP with MLO parameter enabled
> in QMI host capability request message.
> 
> The QMI PHY capability learn is not required for split-phy QCN9274,
> if SLO/MLO is not supported within the same chip. Hence, disable QMI
> PHY capability learn support in split-phy QCN9274.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


