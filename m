Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E6EC3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 16:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0iMW22XVoA5EYuKjSRktWPaoevirJknKUkzcyB462UM=; b=2hYR0VFztuRy/5bD3st81kX8aO
	TMev3cVujIiWPRslh8oEUILyw23c/YcVzGNdEpzqzMdVDDnO1C8glT0XysbZi/oCiyGIlAXMpMB1N
	ztrCR9AwWVsJa8FEoP9hNPcr/l+5OKyg1TDO8gk20sdUlbRPs6phT5XCTw7vD3uUHuG6fV2luBVqw
	xrbFFuayWcg12KCaBbb1sGroA1vK56lZ54xIK09QdxnWriuvyb73liqLvX+AbWpVyN5/qg0BN3qOP
	dCR55+oBDtHvNVFbKocEteseeP0+P1CTDd5Fxd+XJeYtKjxy7nAdUpQ0xWoA2w5aVC2vdx0wb0Bqp
	gbsaddKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL41x-00BND8-2N
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 16:23:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL41v-00BNCF-0m;
	Wed, 03 Jan 2024 16:23:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403Fev5E010163;
	Wed, 3 Jan 2024 16:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=0iMW22XVoA5EYuKjSRktWPaoevirJknKUkzcyB462UM=; b=Z0
	3Eavi45gTHgpnK4xkBkclqXow08wBHY8pXNFrPvPVWjF6POnGkoxo4+U2mkrD7b8
	IF/TtLlyc49kol3+ivvlG92Cp4m/jJqJ8Lj0mu+8Gz/lIw55j3+v1npNjlWUHNHx
	8s/LbDvrkTF4aXD7y0wgruHopRpRLa1DqaS6wpg2Fe7q70KSoF7FZTv4rU2UXLjN
	1WVCmEnPxUmTRkTh0fwR70ntQWz4nUzBzMmWzJFtrS3M6RtmvNnfMoHMbbPxjrQk
	0QvknIc9PBB26xsmb/JV2hV7K7fL7Uex/G+Swdp23s2amdgjKMkuC8AqFgdGVKrR
	s4RwiYMPwiLKxQw9Fx9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd27yhdus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 16:23:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403GNgWU004987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 16:23:42 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 08:23:41 -0800
Message-ID: <70cb1d26-bd6d-4a5e-aecb-b94f1e399d04@quicinc.com>
Date: Wed, 3 Jan 2024 08:23:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240103041220.3082014-1-quic_periyasa@quicinc.com>
 <20240103041220.3082014-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240103041220.3082014-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zTo849a8B9VwkeeUWWkllbQe1bEe13WC
X-Proofpoint-ORIG-GUID: zTo849a8B9VwkeeUWWkllbQe1bEe13WC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxlogscore=369 adultscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_082343_287013_EA7C7B90 
X-CRM114-Status: UNSURE (   6.79  )
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

On 1/2/2024 8:12 PM, Karthikeyan Periyasamy wrote:
> ENOTSUPP is not a standard error code, don't use it. Replace with
> EOPNOTSUPP instead.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


