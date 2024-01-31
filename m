Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EF4C47DB3
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fq1N07ZqMWX9HNidJ+zUIfQ8pVcLFqKEUlt22qlHnkI=; b=D9YzG9KXCaWcp5SobfHTvu57yL
	B4yZzMGEjkjhGIjmjG2gBxVUvcdVAA3UjxNm8RF1QJoNrgggbuwrsXwvB82vzU5vE9QgocEJCaD1D
	kofhSvanAmau+OT/a25jUlkuhIWKbJz+//GPswM2EP56y39CNEaFm9rZkx3Ub/N3piQAIHAZiKNZO
	QNziGH3lnfl/xjhEfP78nT87CZKEa2UIdc6OHP0uJzoW5qxuVIF2q97A9SDc/cs80XXLK0TAI1GcL
	3BG5a2gnxbD2g7tM2/Ynl0UGka3mATsuIX5mdzbt2r3quzWMvTuXikOfdRUBZ3OEiHHBmQ2tGDRyA
	dNAfaILA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHoa-00000005RK7-02hO
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:08:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHoV-00000005RIC-49wH
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:08:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VKG3ND027407;
	Wed, 31 Jan 2024 21:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Fq1N07ZqMWX9HNidJ+zUIfQ8pVcLFqKEUlt22qlHnkI=; b=KY
	ZzWyQ4KP0nSU63WZYgnUA3iAOiV9ctLIVAQXCgOPFw3bTfAq4B+0nXifj5UkiylM
	qDhGy4ZxY9Vhkj0wUg9JtR6W4Z2/UJwBtV2kneL85x+MGFP8IOq8/sD4/qtD3SLq
	rEaV3mwVrA97kDA9rA37+BD6XuuOIfPA4LhTCZRJtlnWZmT/Kbbziiw3ic9VLrDO
	M/hsBaAwK2ouRpHJ3kR5XotKRmZ4Ymyh4wQKQwnlzuAh27N6P2UVp2cBS6V4inXF
	ftq/9LIUoaYB/inuoU8RIa6H2FCS6TqwY12yhbOOpgGkMMxJIGxdKI1tlU5sQLBW
	9w3+TD3OuXPwe2t0OiTg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyfnjtep2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL86bs009855
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:08:06 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:08:05 -0800
Message-ID: <909da932-fbb2-40ab-90ea-8d31ff1900dc@quicinc.com>
Date: Wed, 31 Jan 2024 13:08:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/13] wifi: ath12k: add MAC id support in WBM error
 path
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-11-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-11-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tst5vWwzl8a5hk4SCfibzROMsLKTCDnk
X-Proofpoint-GUID: tst5vWwzl8a5hk4SCfibzROMsLKTCDnk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 mlxlogscore=703 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130808_195659_534ECE70 
X-CRM114-Status: GOOD (  11.05  )
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
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> When more than one pdev is supported in the chip/SoC, the packet
> belonging to second pdev is given to first pdev due to not identifying
> the MAC id in the WBM error path. So ping fails.
> 
> In WBM error path, src link id information not available in the
> descriptor. So get this information from the msdu_end 64bit tag. It
> is necessary to get the src link id to identify the MAC id in the
> given chip. Then only we can pass the skb to the corresponding pdev.
> 
> The msdu_end 64bit tag is available only if compact Rx TLVs
> descriptors are used. Thus, src link id is fetched correctly in WBM
> error path when compact descriptors are in use.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


