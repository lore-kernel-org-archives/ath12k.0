Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54A8CDB47E
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgT7OLd79IWjwLGss2F312Xd+FL3gvsUeiJTVqYJgMk=; b=AeyGJZ9J98jSxP
	8uJY+hcFL9dzXL/3e5w/DBE1B3MOWVqYr0kZfEvZ1Y8zTDSFYfPXiYDr1QKmeYA0aZU2S3eQFyX3Q
	eksJZd19Q64TSB+altJ+veT9aZ4bj99pgQJjyelhFwNSBDg7/X8WIoWKY6vb0tq7lRgyUVSbGNcu9
	6v0H6w1pQ0c5hA2WM9zOoel2fg4fNs0v0L031tl0olM8yS/+MM8Ed2jgoG/eBtmVZqu7jxWGqP6L/
	eAXjtRencs+cdsEUbctolrGSgioq4vcCagL3QxXQxsnYot5zMvfjhjbU0GEXDKQ2CNa2vL3BTmjGJ
	nNPgm3e6SsqOqnnR77FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBOp-00FT5M-17
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 18:36:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBOl-00FT4L-2L
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 18:36:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IH9NuP003342;
	Wed, 18 Oct 2023 18:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=zYcdpJm8D3goGfVxnP0F3GZxK2CB8eCXhH/GRQM1ldg=;
 b=SdzY5jyXvh6jBeCDEtdZ5EpCKZEuyTL8VFl90atSCEx6qElNZNxStM4985UeCaoaSP/y
 jBKNxhthevyJfkVX+7hxZ6lUWTHwQeYX5/ngNyFJqWk05LmJ89a2vig9iUJxIzIyPDIC
 k9rwmZz/y27o3jtp77KRlFyL4dCHR2B3lTPfsaNnj/KVd+toAI1ZmB4VDfUO86MljJhO
 uZI4sdQFATwGNMX5J1b9jSeKlUjVXUNS5K5+8aeBGnlTLsiR1cPe872G8rUtUT/bnypl
 dnpkrIWsDUqDNdBec/a9ZeolZFVgeiz5ME23cPRQub/S8IYTkpqsNAJJFuBtB8/j83P1 hQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt9059uuy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 18:36:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IIZxcx020867
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 18:35:59 GMT
Received: from [10.111.183.229] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Wed, 18 Oct
 2023 11:35:59 -0700
Message-ID: <48fd22e6-bf94-45bf-9881-1ee6b3c0ac83@quicinc.com>
Date: Wed, 18 Oct 2023 11:35:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: rename the sc naming convention to ab
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231018153008.29820-1-quic_periyasa@quicinc.com>
 <20231018153008.29820-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231018153008.29820-3-quic_periyasa@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q6oLJy-1HEkrNEpjugTOa3DQGowp997C
X-Proofpoint-ORIG-GUID: q6oLJy-1HEkrNEpjugTOa3DQGowp997C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_16,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 mlxlogscore=610 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_113603_766839_0BAA8E65 
X-CRM114-Status: GOOD (  10.64  )
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

On 10/18/2023 8:30 AM, Karthikeyan Periyasamy wrote:
> In PCI and HAL interface layer module, the identifier sc is used
> to represent an instance of ath12k_base structure. However,
> within ath12k, the convention is to use "ab" to represent an SoC
> "base" struct. So change the all instances of sc to ab.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
