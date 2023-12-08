Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94960C4167B
	for <ath12k@archiver.kernel.org>; Fri,  8 Dec 2023 00:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8ZzvxzPr/MezNcUbjarSDHvvjVU7bO3w3ZCSVYgJMo=; b=e4g6HpuxPpFhME/fR6oCR/md+k
	L22wHrORM2krvWkdJFqyBTIQ8czeVMBFZRE4naXTdsndOJzyzobg6gky7+imG/zWOSQdyYHrCiSnm
	5a5Lu8s5Q6WprSXC2+iUk19qFGINgagWKub/nVRrTf+FNMVh9C2yE8d532qYoC6K1OAudVEM8v7Fe
	pLlAvXo04oBnHoJraFbdGt4KDLAxeyTJXVYZjb6Ku3SZ92MN5KaeYGE6ZnOprkkpW3Eb+NdUiHOnq
	oW6GcxK0aD759qUMBz7O5nZhqwCLMFCkLGXRGhzLiNOqiw8i0d6nnLQJF37ZHOB/GaD10j5otgBY5
	lxqqLODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOdz-00EJEy-0c
	for ath12k@archiver.kernel.org;
	Fri, 08 Dec 2023 00:23:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOdw-00EJEK-2A
	for ath12k@lists.infradead.org;
	Fri, 08 Dec 2023 00:23:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B7LtbNE006399;
	Fri, 8 Dec 2023 00:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+8ZzvxzPr/MezNcUbjarSDHvvjVU7bO3w3ZCSVYgJMo=;
 b=aYkEqK9k6E9DUXDEzPnZqbUoP4kJkowefYTUIBKZ4EAo+k8SxCHQ68JylF30QPJeYZfC
 g/vByKUeHD9xsZNWjFT1QVLNxbTqPkMCXuhTVlU2nQtQSR+dSyI24T5juAMsQSVC5THs
 L9PW0lxv2uIrFR+uCCdAFxroK43biF8sC4u0676Q/IbVz6ogvBCC9T5nJVFFV2dBxRB9
 +MD1TgoVfieU+sqMjxfeozIaBKUHy4trun1RIPzHKCuutklYnVIigYLbwcOBnCjdMCHc
 XMQ59wawSKMbrrFGC4Ns51JlwEtSB1S34ThkXCMGlFA8T15/N+23V9y2WbLe3N84yjWW HA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu0w53c5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 00:22:59 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B80MwRs004653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 00:22:58 GMT
Received: from [10.110.111.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 16:22:58 -0800
Message-ID: <b629f75d-9726-432f-aefc-053c85809511@quicinc.com>
Date: Thu, 7 Dec 2023 16:22:58 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: ath12k: Refactor MAC setup channel helper
 function
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
 <20231206034920.1037449-4-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231206034920.1037449-4-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YkJvC11MOeRij_qcQF2nPoWDhtiqnqfx
X-Proofpoint-ORIG-GUID: YkJvC11MOeRij_qcQF2nPoWDhtiqnqfx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_18,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=427
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_162300_714625_A8F5A81F 
X-CRM114-Status: UNSURE (   9.56  )
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

On 12/5/2023 7:49 PM, Karthikeyan Periyasamy wrote:
> Currently, the MAC setup helper function is accessing the mac80211 hw
> data. In the future, to support single/multi link operation, need to
> decouple the mac80211 hw data from this helper function so that it can be
> easy to scale these functions to support single/multi link operations. So
> remove the mac80211 hw access from the ath12k_mac_setup_channels_rates()
> helper function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



