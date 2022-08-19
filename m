Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7061C00140
	for <ath12k@archiver.kernel.org>; Fri, 19 Aug 2022 00:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0C8WyU7DviUUZqRVuwI08RKAVgfyEUcSCrHftxMujs=; b=s/pmRpdrh+EraZ
	wgHuqvYAp/n172ych2i5AajxUqdfyCws8v6qL7SQTBAsK7lNOtyTo9ucivqU3YU0qZqYubOD4pBWN
	alh++X7+yfbvtbKY+ZFiwIkFIC7F6GscfJj6qt47+Tg3VT7fA0tyaJLYqRPb5af3vOrLMuK6tCfcv
	2dtDdk/h2jhd43LP7Fmu9k8mSqujB9G/PbqKpM7W/z8MS6xJqHba+nHwgXp8N/7cPSq9f8CZlOxw0
	348YjdXeISkvyJkbScR2rzAz2NObz8bGWUCH9pZXA9JzIhtGDAJ20Zxng51EfWq+nQDuc1yMHLwza
	uUhc6Ak3p0NCCgKWzrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOppe-00C1Yv-9q
	for ath12k@archiver.kernel.org; Fri, 19 Aug 2022 00:25:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOppc-00C1Uk-BE
	for ath12k@lists.infradead.org; Fri, 19 Aug 2022 00:25:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IM8ujg010663;
	Fri, 19 Aug 2022 00:25:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=eCePU0CaJho/yl4mxE+0XC+oKntRBLyeUcOw8HC26YU=;
 b=Lk46XUamU3BaI0Y7N8jMJ+WlYn7cevB2D0eYuH1MYY8aVYB8jwHF2tggJkClGxJniHu0
 PHn70lpxv/72vA3Zcr4ftB/ObtJCh+sO8maCvAfYybKDY3Dv9zsMLob35aXGdXmg9mde
 glllvWpVyJDxyDho349FWLVUo+7lMkH50pUuCK6bvTbhgp/I5AfUFk2y6iCKN0VaOgNV
 q3EkEPQ8zNSH20gtVEu9R3gDOcr4If1hZHown1863MM8PPBqOg7NCTT6xg82CWJzQmdQ
 M/JGpNhI60eI2bzL24ECww1iD7rF13Dcu5AN7FaSobPn9ZRzToasag4kH7GPVh+HzrSF cA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1ttq8qwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 00:25:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27J0Pijo027545
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Aug 2022 00:25:44 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 17:25:44 -0700
Message-ID: <f6e2c694-4803-be69-ec05-08541b718b8f@quicinc.com>
Date: Thu, 18 Aug 2022 17:25:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 40/50] wifi: ath12k: add qmi.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-41-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-41-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vc3xSvqmvGekMX9J_AN8VvNPcPFMSHxZ
X-Proofpoint-ORIG-GUID: vc3xSvqmvGekMX9J_AN8VvNPcPFMSHxZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_18,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxscore=0 mlxlogscore=881
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_172548_442756_0616FF07 
X-CRM114-Status: GOOD (  12.40  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/qmi.h | 610 ++++++++++++++++++++++++++++++++++
[...]
> +struct qmi_wlanfw_ce_tgt_pipe_cfg_s_v01 {
> +	__le32 pipe_num;
> +	__le32 pipe_dir;
> +	__le32 nentries;
> +	__le32 nbytes_max;
> +	__le32 flags;
> +};
> +
> +struct qmi_wlanfw_ce_svc_pipe_cfg_s_v01 {
> +	__le32 service_id;
> +	__le32 pipe_dir;
> +	__le32 pipe_num;
> +};

curious why the above two structs use __le32 definitions but none of the 
others do. I thought the QMI interface would use the qmi_elem_info to 
properly encode/decode in host order on both sides of the pipe and hence 
we should expect host order on both sides

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
