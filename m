Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01ECCD4F50
	for <ath12k@archiver.kernel.org>; Thu,  5 Sep 2024 04:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsRjdcOeLOSqcsHJLlCvhDBqx73KjSdhVSXc4Vb9rY8=; b=QMypB++9u/y+ZNlKZy+VueZNN+
	CW93hkfogBMrwAnvLbuSFdx9M6QP/TcJnqByeK3WnUdUkudxhGeG7qnSDUBCFGGfzfiIg5djeCfwR
	QwfyKOThUGQYx38tj68ke8sQcRne3a6b5nMkMnfT6fzNq4sRMskec5Sroelz3Plz0KSJyKQTmR7E3
	uSCfcJqRZWNBs0I4nA1GgYHAwLFUtnjcheHpvS3BjM7FY0gss0P6JmNcjX6vJneIssResTcVIwWpB
	szSrw/KfvXmr5S+5TyzWWY7rMEvTbIZYszo1kAowb7wzb8ghZGz+ZDm6ZGR3BjNDxg8L+M6dT3/gg
	PWQJ0YiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm4VW-00000006zSk-1DSy
	for ath12k@archiver.kernel.org;
	Thu, 05 Sep 2024 04:54:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm4VE-00000006zQz-0gBa
	for ath12k@lists.infradead.org;
	Thu, 05 Sep 2024 04:53:53 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484MO7AS002825
	for <ath12k@lists.infradead.org>; Thu, 5 Sep 2024 04:53:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nsRjdcOeLOSqcsHJLlCvhDBqx73KjSdhVSXc4Vb9rY8=; b=AbuDrtQo1beG0B3h
	ycXLExxrOTkEVU23DMuzIXP2u0OztnOuJArPYlsTuDNX9Tukn1A6PAM/WS0A/huz
	exBKPZJy0nnD6GOfm2k/aidHAM7taJBlJQS8i5wqcnEiEiCB5ipj+ah1gPca9xgO
	E/Not7ePWP+i4cp8M5dcPncO7X8eMxFz8gvJ8W/3y0oj6O9Cfg/BjEpbU+/x7eYL
	qteXinXB0m4XAoV+h3/gEIq2mPoqc9/wKACKH+65WJKwzZn0N+X+YkGhrjaBqMAp
	sBRWPZeOm2IixQyYAwVgJzeTgBv2CPoB+CCs+IqBsOXQkVA4Ind3bcrHQq2y4cEo
	KDkyJw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe735e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Sep 2024 04:53:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4854rmW9023891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 5 Sep 2024 04:53:48 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 21:53:47 -0700
Message-ID: <abb0bbd2-2c3a-0f58-13e9-2e4cc8641a6d@quicinc.com>
Date: Thu, 5 Sep 2024 10:23:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Weird layout of struct hal_rx_desc_qcn9274
To: <ath12k@lists.infradead.org>
References: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <D3XL7VMHE62Y.3JJPEKV07MJAS@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: N-WeWxdQuz-zYXXsDCaEMrZ2S2mTdCfS
X-Proofpoint-ORIG-GUID: N-WeWxdQuz-zYXXsDCaEMrZ2S2mTdCfS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_04,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=706 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_215352_420782_B7DD749A 
X-CRM114-Status: GOOD (  20.91  )
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



On 9/4/2024 8:29 PM, Nicolas Escande wrote:
> So I think I've stumbled upon another weird thing.
> 
> In rx_desc.h the definition of hal_rx_desc as used the firmware seems to be
> varying depending on the HW and on the use of reduced metadata (with some tlv
> registration magic that seems to select the info we retrieve, 8bytes at a time)
> 
> // For QCN9274 full metadata:
> 
> struct rx_msdu_end_qcn9274 {
> 	__le16 info0;
> 	__le16 phy_ppdu_id;
> 	__le16 ip_hdr_cksum;
> 	__le16 info1;
> ...
> };
> 
> struct hal_rx_desc_qcn9274 {
> 	struct rx_msdu_end_qcn9274 msdu_end;
> 	struct rx_mpdu_start_qcn9274 mpdu_start;
> 	u8 msdu_payload[];
> } __packed;
> 
> 
> // For QCN9274 with reduced metadata:
> 
> struct rx_msdu_end_qcn9274_compact {
> 	__le64 msdu_end_tag;
> 	__le16 sa_sw_peer_id;
> 	__le16 info5;
> ...
> };
> 
> struct hal_rx_desc_qcn9274_compact {
> 	struct rx_msdu_end_qcn9274_compact msdu_end;
> 	struct rx_mpdu_start_qcn9274_compact mpdu_start;
> 	u8 msdu_payload[];
> } __packed;
> 
> 
> // For WCN7850 full metadata:
> 
> struct rx_msdu_end_wcn7850 {
> 	__le16 info0;
> 	__le16 phy_ppdu_id;
> 	__le16 ip_hdr_cksum;
> 	__le16 info1;
> ...
> };
> 
> struct hal_rx_desc_wcn7850 {
> 	__le64 msdu_end_tag;
> 	struct rx_msdu_end_wcn7850 msdu_end;
> 	u8 rx_padding0[RX_BE_PADDING0_BYTES];
> 	__le64 mpdu_start_tag;
> 	struct rx_mpdu_start_qcn9274 mpdu_start;
> 	struct rx_pkt_hdr_tlv	 pkt_hdr_tlv;
> 	u8 msdu_payload[];
> };
> 
> 
> Which gets then used as a generic rx desc
> 
> struct hal_rx_desc {
> 	union {
> 		struct hal_rx_desc_qcn9274 qcn9274;
> 		struct hal_rx_desc_qcn9274_compact qcn9274_compact;
> 		struct hal_rx_desc_wcn7850 wcn7850;
> 	} u;
> } __packed;
> 
> 
> 
> So it seems without the quadword registration, even though qcn9274 & wcn7850
> appears to have similar layout, the __le64 msdu_end_tag is present in the struct
> hal_rx_desc_wcn7850 but not in struct hal_rx_desc_qcn9274. That seems weird.
> Would this mean that firmware always sends 8bytes of msdu_end_tag in wcn7850 but
> not on qcn9274 ?
> 

yes, qcn9274 not packed with __le64 tag.
wcn7850 expect the __le64 tag packed in the msdu_end and mpdu_start.


> It seems unlikely as when using the compact layout on qcn9274 (the default now)
> we use QCN9274_MSDU_END_WMASK with QCN9274_MSDU_END_SELECT_MSDU_END_TAG (bit(0))
> which seems to indicate that this 8bytes tag is part of the optional data that
> we can select (or not) to be received from the firmware.
> 
> Am I missing something ? Did that even worked before switching to compact layout
> for qcn9274 ?

Yes, tag tlv is configurable in the compact word subscription mode.

Before compact mode, qcn9274 full mode is worked without any issue.

> 
> And if it's not working as intended, what's the layout style we actually want to
> use for struct hal_rx_desc_XXX, do we want the __le64 msdu_end_tag inside the
> struct hal_rx_desc_XXX or inside the struct rx_msdu_end_XXX ?
> 

Either way, __le64 msdu_end_tag is part of the msdu_end because 
ath12k_hw_wcn7850_rx_desc_get_msdu_end_offset() tells the 
offsetof(struct hal_rx_desc_wcn7850, msdu_end_tag) not the 
offsetof(struct rx_msdu_end_wcn7850 msdu_end) in the 
ath12k_dp_rxdma_ring_sel_config_wcn7850() configuration.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

