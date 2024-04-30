Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17654C04FFE
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 01:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLV9jDQC6ISn9JYyf1c8SVeqZuQ+/rZ02Rk06O3kNGs=; b=Qz5eEOfWBNDtQyljWXE7hCUCW6
	5l0pHzuXa5MRC/FHmV6OJNdj2DLjMvPYysPYiDpBHXoW9mcQSsOfb1Mu4scGRjzVZRzaosiW+Seye
	krbhoBbQkYO3QxoMWKjQuhrKALFYd52/zW/XTZtnhDisBU3bOHKVe8h1bcdQc96YhououumdJJDwk
	F4MIJeeb2nBSx1yl++vrEz3YZiJHtLYS5Bt9X02Y8+tYEl8nsr6NnONobA0+ykXw3Y3p05LWoJQPu
	bLJUf7MOnTfsKavMU+lPiVtMqNRhFeDjHXXwyrFa7l28etlFhNqeHEGKFbh5IyUnU3HQlMLlLeMgK
	9ZRhyV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1cef-00000004jOy-3NTp
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 01:51:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ced-00000004jNn-0HPN
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 01:51:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43TMp1bY002388;
	Tue, 30 Apr 2024 01:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=kLV9jDQC6ISn9JYyf1c8SVeqZuQ+/rZ02Rk06O3kNGs=; b=NJ
	sXV8jIz1x2tS9HaH7lWkzNklOjpaH2WF+muJ7fYFMmbbrm65vjLltxDOmDZ0p+0h
	cHLcClK+LGPR06hRtvIQVSgQ7HR2z36kGml/MV0xNvS27ZoRyyG1UnKxYj0Cc40y
	EPKt470iv+TPek2pkC0WVcDe7hreMSQ4TUy+exa0wmMCz80DA++KkG5PpyPUSS4I
	ybVceAnBryH/AZUJseYtUPwOVRVUw0a92wTwiK4umhoTnb1CMhcNI22SRk06S2p2
	4j4itRbuN95sZQNVBTQwjrOhyCwS8VRrpU9asQZjXeHNZyKuDCvHHw4Hr5BXM+x+
	CR2Gn7Ex3eG4pNf5nfGQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtm3ugqwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:51:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U1pWid018177
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 01:51:32 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Apr
 2024 18:51:30 -0700
Message-ID: <e32ac83d-02d0-45e1-acac-7a466cdf41e3@quicinc.com>
Date: Mon, 29 Apr 2024 18:51:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] wifi: ath12k: avoid duplicated vdev stop
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429081525.983-1-quic_kangyang@quicinc.com>
 <20240429081525.983-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240429081525.983-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0VwLEW_rgIoLGnK6dfldd_foqZHxdUk1
X-Proofpoint-GUID: 0VwLEW_rgIoLGnK6dfldd_foqZHxdUk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_22,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=799 adultscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_185135_562837_747B0AD2 
X-CRM114-Status: UNSURE (   8.38  )
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

On 4/29/2024 1:15 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> ath12k_mac_op_unassign_vif_chanctx() will do vdev stop in
> ath12k_mac_monitor_stop(). This ath12k_mac_vdev_stop() will do vdev stop

s/This/Then/?

Kalle can fix this in the pending branch

> again, then might trigger firmware crash.
> 
> So add judgement to avoid duplicated vdev stop.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: c9e4e41e71ff ("wifi: ath12k: move peer delete after vdev stop of station for WCN7850")
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


