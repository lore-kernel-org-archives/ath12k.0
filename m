Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428F6C47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9suEDjCH3ZRAErXkdvtjYTA9UALQ6PNZVwXSW/0tN7I=; b=Jyf/OO404HUPH1T3m4LqS3YPOP
	1vHEIOSbvN+j35FpS7CKn3GexEaoqPVpyBFXjrVIBcnePght3Ug9NcCbCUtvwsfh3sMcLYU/U5Ibo
	wmD/Uo0R1+t9y7uw0ZZsUqJqTETozTgpXJ3lfahokcCrRDUcTjQGeKu0A77U3sErtxEkb58FW8zyp
	UHbvoK5BM6FKW06yNByJiB5lCnh0C53qiEVm6ISZyjmNCKECaah843wQNCe1EqFOVwL7Um7gQcEq5
	GtCO+2qV6VOHr1DxiuIBXWzqWPW5+ZoECl+aqtWgyF64oBG8xDbLL8q9yzi9YCBWqHFo5VrfCI5PD
	xdorjUbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWMz-00000005wVP-47cM
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:16:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWMy-00000005wUz-0Mb6
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:16:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40R0GDvC016155;
	Sat, 27 Jan 2024 00:16:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9suEDjCH3ZRAErXkdvtjYTA9UALQ6PNZVwXSW/0tN7I=; b=ax
	4b/ItXxCZiN/MrPueqDMp3xn2x8uK67YXOR8su+QZOrSC0wUjwLJSytyXIgcB8Y/
	ADtHNTuft/Xafo37WKIjRP9bWd4FbMynA39mwV2gZn88sJNPrDKeQhZIFSBO/woH
	/oZUVLSgepRfIJ2r7KcacIQCdONpaG43Qnj/mOGNE9CiVOXCrbjmw1wfdztCVLr4
	6OBN2hEQXCdhiUjCgMcImFlC1Rjzrl9kxPbUaoWzIgfwY+WR0G7Kk1f/pTFxZRBX
	OsFhNGudRO3Li5+D6lrsoNdR2F+MY7TP1uhW0nVnapE8fQ8HJDLea+qDY3rz9wnj
	qzduOR1B6UIbhOjSP9nQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv4f9je8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:16:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0GNga003366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:16:23 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:16:22 -0800
Message-ID: <b36f7ea1-0e2c-4076-829c-faa71baa21c5@quicinc.com>
Date: Fri, 26 Jan 2024 16:16:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/11] wifi: ath12k: implement remain on channel for
 P2P mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JFkBqe_zCNCj0x7tYPkPCzeYsUaP6OfL
X-Proofpoint-GUID: JFkBqe_zCNCj0x7tYPkPCzeYsUaP6OfL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=597 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401260178
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_161624_165808_932522A7 
X-CRM114-Status: UNSURE (   6.59  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
> Implement remain on channel for p2p mode in ath12k_ops:
>         ath12k_mac_op_remain_on_channel
>         ath12k_mac_op_cancel_remain_on_channel
> 
> P2P device can trigger ROC scan. Then keep listening or sending management
> frames on particular channels.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


