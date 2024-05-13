Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEF9C25B10
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzX8ezWmJu9SVh10wVS08QblP+e9V06MlCpSSPnTQ5Y=; b=UPTBhmpdP4mCw6czgKBdDdSi1F
	8hRCBNJ0GCy1+J3ExAxnwCLFAlcixo7Xje61F0F0o6LGap1WkFCRPE1oEopIa3kQY2wy7QqQjQ1Os
	FxFPBO95Om9vK6n8etGzG92WRxDesIzPScLIOudttOaonUoxAJeB7AiZQ3X6+41wR3NkG6nz4QYYH
	pxXA24PZt1OGLlAsDb4NW7VhPedHVKmTLMLDuEorm6U0bTN5U+GAw7mO6nNoh06xFhrXCzsmp+TF6
	TGB9Lxk84cLnMijjePlEwQiB1UwT6HE6Tm/0iLchyy5O7zr/+D2gKgAKBDSJwpIfResaP0TB3RFTW
	mQXGl4dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dJE-0000000EGsX-0qVe
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 21:34:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6dJ8-0000000EGrP-0kwv
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 21:34:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8vtf003187;
	Mon, 13 May 2024 21:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=bzX8ezWmJu9SVh10wVS08QblP+e9V06MlCpSSPnTQ5Y=; b=FY
	eJDCGxZgKnuwRUh+HdcsnzTChEZj626JdydNXHxATkOncM79ROLkMIuCjW1L1DxN
	Yb2scJ0aUzh1dW/bUuGe39z38DiBAeNPVH/OQ2E8ukzGLWV8svl8vtI5j+8it3e1
	afwzdS6+PXvhGuo3UcX6Q64Y+tUgQiJuDJ7ap143vIGec7uWGZg1zH3PuDb2EnMa
	Zv1Uu3ihS/BXSdtsORoz7nhrCD1TQthVlUxq+KvDWjQjOVUsQ6XwXjo5mCHfxZeW
	/68CVJi85sWdqyfHE7i5dd9qMEzT+x5vZrVSad6p2cvxTpRQ97W9fUQiT53VEXkD
	gse2XchqRnJ+v+XnH1sw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21uhcfxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 21:34:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DLY4LI009158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 21:34:04 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 14:34:02 -0700
Message-ID: <a9d66ca6-fcb5-4bf0-abc5-e483518eecc2@quicinc.com>
Date: Mon, 13 May 2024 14:34:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/6] wifi: ath12k: support SMPS configuration for 6 GHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240508173655.22191-1-quic_pradeepc@quicinc.com>
 <20240508173655.22191-7-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240508173655.22191-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8-FQn34eFEZMPeK_VMjvh0mYtyighwal
X-Proofpoint-GUID: 8-FQn34eFEZMPeK_VMjvh0mYtyighwal
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_15,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_143406_279002_20AAB02D 
X-CRM114-Status: UNSURE (   6.11  )
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

On 5/8/2024 10:36 AM, Pradeep Kumar Chitrapu wrote:
> Parse SMPS configuration from IEs and configure. Without this,
> SMPS is not enabled for 6 GHz band. This is disabled for
> WCN7850 as hardware does not support it.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


