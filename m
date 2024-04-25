Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336ECC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvxRf/UXBGgOwTLlCEhY+OSGgozalwQK0VhYnFNEkj8=; b=uAiArWcEcgdkzwzSxCXRyforZ1
	OaAmY2XuuUtlnxc8RAaUG42MhqoTG6J2MCa1p0ygrXsU0s5nR4nKh//M7qSmSQKUf5ZZBF3byQySO
	cgVqHxiAqQnq7nStlF0KYv9gOd29sT33u7H8/o6G5L65EHO2PTgHt0tUrosJnBZ48tIBzG1rQLjhr
	t9koeWMV1NvOIwULHprCSdj4qpvebxxKiOFl5wITcTEjFa1xKArK6AY2vhhSR/NW3UZlIxqrUK7ku
	05M+7TzMbNgh6pYa84DNdDD86i5yzZuePbpJW7KRliGx6TLX04mDAepTYlaVAxQ4SnNGA6AK5gKJm
	EzJw77mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06Li-0000000ACIz-3Kat
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:09:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06Lf-0000000ACHR-3BoX
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:09:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PGFwZP017320;
	Thu, 25 Apr 2024 21:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=GvxRf/UXBGgOwTLlCEhY+OSGgozalwQK0VhYnFNEkj8=; b=hf
	cZJ0n/MeUVY3h6Juymu6XG4Ft1VnFTAOeUJqQulu07knNhktacACDZAZGG10PV2N
	F74R+KHDsfLmkCz5CISVAKeiBQu1c+0duZ70MdeuDsTYYJ8w6A/WSTeJigI6zUK6
	vhLb7VOMsAPTbx118xeaVUOgsp9a0pgvR7zwDZ02RzzKCCAJSlkEl5qCpZJUb4Yh
	NnR0wXQ7wT0DyG8k10pxdT4fX3AsyHpgRApWX/wtSeP9Q6dHd4LoNTn2qKcA2TUW
	B4B7MWXlUdxizoPOBuXrBDCVfW1CV0pNt369755Us3L9lC0jVLdxMks8YKbXKA6c
	z94LDIU1xp55N4+tEdkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqthv0ks7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:09:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PL9VUS022770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:09:31 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:09:30 -0700
Message-ID: <f93764b1-808d-451e-b33c-076161dfee4e@quicinc.com>
Date: Thu, 25 Apr 2024 14:09:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] wifi: ath12k: Refactor the hardware recovery
 procedure
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
 <20240425090307.3233434-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425090307.3233434-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QI5yIEbqgcfXTqa8CHja2xYntMY4yH5N
X-Proofpoint-GUID: QI5yIEbqgcfXTqa8CHja2xYntMY4yH5N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=606 malwarescore=0
 adultscore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_140944_144222_78CEEB88 
X-CRM114-Status: UNSURE (   7.08  )
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

On 4/25/2024 2:03 AM, Karthikeyan Periyasamy wrote:
> Currently, in multi-wiphy models, the recovery handler access mac80211
> HW from the radio/link structure. This will be incorrect for single wiphy
> model, as they will hold multiple link/radio structures. To fix this,
> access mac80211 HW based on the number of hardware in the SoC/chip. This
> approach makes the recovery handler compatible with both multi wiphy and
> single wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


