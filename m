Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3613FC47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AdCxjrmHEg+OzU5QxypPVr6TDOJpA38ZPy5KupGHYY=; b=lNbnNqzzz0gjTNtRFtv2rvohwC
	I+ybR26S1eRO4TxE3JE2iGXZ6xmXuGOUQY9aWBilYv013XZVonJrndGIgD+IVjSDZlHGWISx6o4u4
	xFBfaKrl9aF+JLUdQJ3NjECJ06FBUiy0/YcLgg0eYL7Mgf0xjqYS3+NK3/1vUOKCWWoMwNmcBqMrI
	ajTvpZUsCs6TZIVZCKgjyIV6QJ/wVeQfHeaj40pYRSo0YDCrFH9t+DWt6QyYGQIhUps3fONWMfmTh
	O4GhGRvCEe7f8U9JjLUn8hNzz4amaqnyuKjNNEWMLz5nY9BzfxYCNHAw8WcjU+aXc9gh57T+uViOy
	Xz73E77g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHnN-00000005R2S-3kOy
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:06:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHnL-00000005R1d-1hjK
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:06:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VJ0SxK029897;
	Wed, 31 Jan 2024 21:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8AdCxjrmHEg+OzU5QxypPVr6TDOJpA38ZPy5KupGHYY=; b=Xn
	gjLnKVvSBmt21oCjmHRIomjjhytbgUDTaY/Ht+E0wKetQ5pGwy9gRNFHssMU7dxF
	VBtbdjRvXiiN12hzl/b30H7MyUlSzMkMvnsolweKcGCHFfDGQR/FEG2coZyRIA42
	JN/JOppxWUWqx3jolMumlaqAMN7nG51ah4jmcjM0vF9FC978Vw7t7LKwGrQ5w+ji
	GGSKpcWnZaGiUaUggrKosRTti4SRT5JpfYQj+HTg7uas0F8txi8bxi01G1Batz4u
	X/HVnUwT8ZvTW0A5HqTFc6kLnDlsBSSDmWqaxiXQVuEcshCA4ujn31UBmacVG+8J
	gXE9tH9KdDwapFGjK86A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyj149xgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL6re8021712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:53 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:06:52 -0800
Message-ID: <ad7d59ee-a43a-4f3b-862a-2193b8e4259a@quicinc.com>
Date: Wed, 31 Jan 2024 13:06:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] wifi: ath12k: fix firmware assert during insmod
 in memory segment mode
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-7-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-7-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H_cFOyrX4S9F_c2UNf7wp5CNIvDNZiaQ
X-Proofpoint-ORIG-GUID: H_cFOyrX4S9F_c2UNf7wp5CNIvDNZiaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130655_608206_798D5BA4 
X-CRM114-Status: GOOD (  11.35  )
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
> From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> 
> In segment memory mode, firmware allocates memory segments of size
> 2 MB. This 2 MB memory is used by firmware for the number of peers.
> This number of peer is sent from host to firmware during WMI init
> command. For single-phy the number of peers sent is
> TARGET_NUM_PEERS_SINGLE = 529 (512 + 17). While for split-phy number
> of peers sent to firmware is TARGET_NUM_PEERS_DBS = 2 *(512 + 17) =
> 1058. With this 1058 number of peers firmware is unable to allocate
> memory in 2 MB segment and firmware crash is observed.
> 
> Hence, fix this firmware crash by reducing the number of stations
> TARGET_NUM_STATIONS for split-phy.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Co-developed-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


