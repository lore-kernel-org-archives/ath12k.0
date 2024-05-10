Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC2AC25B5F
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+0xBc/eDPjXUV1VOPKm7svDHFTOgoJbqPcgXjfFUOY=; b=wmLmWJTBhDPdfPbTgKbwtJarCD
	d7KYRlkKgJDR706WvxPHDL3IXqSZ9C36pNgcJhanXxu3cKtxlupafeuWCCmadvNcICG2eSkUn+Ffe
	OF0afGk/Y+BkqmJ2JOeEFhdh4hCIEiCIcQudPpFGILxSN6sOKxcAvG1/lrEvxDErphNQr/bsK3r75
	54JU1iNFa8FKapr9EbDdRLYeUgELiTeByMwOygZzIvC6iHLhRqbP7f7squ9aLN1v7xDbVBdTj5p0F
	AhMDzGf/mSqe43hx2UCyZKkOI5DqQHkLnrq+oy6n8u8LTF7aBNrTwiroO9jct2kurQTnlvp+8li3f
	7Feu9iDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5RLh-00000005ZsX-2VG3
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 14:35:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5RLQ-00000005ZkY-39G7
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 14:35:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AEPR2b029759;
	Fri, 10 May 2024 14:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Y+0xBc/eDPjXUV1VOPKm7svDHFTOgoJbqPcgXjfFUOY=; b=f9
	WGmv9pOWJX7MW5rFDO1vFyPZ1Wz0r5AnScXd2Em6Fcw0E0ZX9gtoY91Q+osurjQR
	BluqXa3f6TYYW7dl12/Yidi9yvGd8Tmk//8VCUwvlI28xKMHMfB5Co2JDCE18BEg
	4FtOYLRAu+EWyPd5aLCT65shU449Sq0VK5VLP7Q5oByZ7iwrjs/Ti4vReHQu1KZ7
	+6oLcXQ08Ijz3Fg8dgdtvD0YMNdh1PGEIhY7Kw41593p6kguAmOHrozBSz/NdkS0
	E0jm2bwMWAXXnLoSuJNYEnJPhGKVd3+cor0tERQdLDgLZpt7o0WdMGD2POkyASqL
	Fo/kAzCqhZzdnjdMwgyg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w19s4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 14:35:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AEZTTM028056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 14:35:29 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 07:35:28 -0700
Message-ID: <e9765b8d-b8c4-46e7-b713-6fb8464b04c0@quicinc.com>
Date: Fri, 10 May 2024 07:35:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: remove redundant peer delete for WCN7850
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240510111238.1113-1-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510111238.1113-1-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mNwn-P-ecroa5w7nKIbk336YUXX6XveR
X-Proofpoint-ORIG-GUID: mNwn-P-ecroa5w7nKIbk336YUXX6XveR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_10,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=886
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_073532_840285_6294660D 
X-CRM114-Status: GOOD (  10.28  )
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

On 5/10/2024 4:12 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> ath12k_mac_op_unassign_vif_chanctx() will do peer delete for WCN7850's
> monitor interface.
> 
> But for host no need to do peer create/delete for monitor interface
> because firmware doesn't require it, QCN9274 is the same.
> 
> Also, the first judgement is true only for WCN7850, so this logic won't
> affect QCN9274 at any time.
> 
> So remove this peer delete.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


