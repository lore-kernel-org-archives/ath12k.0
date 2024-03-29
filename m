Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE671CD1283
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muMVqwiyAAh7TZzR8UetaWk+MGxnU6dzQ9bp7G8aFB4=; b=YSF7mueVh+kSLtcj/v/gKlOHgy
	Qy0/IWbRXQzTg6sMJqtKuAGAoiLAUvopOQ9b4LghEWW2Whuob/WgHroWlt5MYAAK3lq1hv10Au1YT
	qDYmnF3cgtWUjSXnZmasoJnUfv/5ZjTTpKeegFWigiskC+zdJknyvAUEY9n651x+x0iscXCI7pas1
	x7byaOvNU8uh0pWH01JKAKUjYar02bvZAlWlZ5UYLbqp/MKgpEpuu1+nPYidMZHMsVwRFukBEAAhN
	IKUR1OTpBHhFeiffM6YPcbJInOG0vWu2JOL2Cqv8mz7BLoAIEFTRoPTVRNogjjf6+jSNN1ZjwMCj1
	Rl4JAhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGn7-00000001aLH-2aYj
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 18:17:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGn5-00000001aKw-1xn4
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 18:17:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THfJMI028878;
	Fri, 29 Mar 2024 18:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=muMVqwiyAAh7TZzR8UetaWk+MGxnU6dzQ9bp7G8aFB4=; b=o4
	SjT6bWqTiaDd+E/S6qo2W91+hl1lWvcTWAx8yJ1R/VQJFMK3HhwWXuuKUV6lqFQu
	VAFFDkzMK03Fek3mDNihqG2E8L2B+GNMykKlgW6a9Ht2L27NJgBafUhz3UrGcEjZ
	5a8xadjcqmyhkyMnv2CMYLN+xu9kqtbaHEHQFWgyL9hxKac23M0pnoit4z7u4yki
	Y9vVckenW6E3hiWZuFU9/+XLmPFi5JwC8CkuhUXWCXeOTrSYcXyrPP+tiVdiXcl2
	3mVBkKMf8f0RrsY1Lvvnp2G002FhMZwZZK9pEB02jIYASv/fckkEsval4rysbtOs
	lfG+w7Lz6/6jJqrsRmVw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5ybmreuv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:17:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TIHLRk030962
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 18:17:21 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 11:17:20 -0700
Message-ID: <913c8bd0-5b46-4b4b-b0e5-723d2ae6d0a8@quicinc.com>
Date: Fri, 29 Mar 2024 11:17:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] wifi: ath12k: fix survey dump collection in 6 GHz
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
 <20240329173926.17741-4-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240329173926.17741-4-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: slj8PFtQO7CvUt1CGeWrCUmaxrdKmNCz
X-Proofpoint-GUID: slj8PFtQO7CvUt1CGeWrCUmaxrdKmNCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 mlxlogscore=766
 suspectscore=0 adultscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_111723_676558_DD154779 
X-CRM114-Status: UNSURE (   6.75  )
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

On 3/29/2024 10:39 AM, Pradeep Kumar Chitrapu wrote:
> When ath12k receives survey request, choose the 6 GHz band
> when enabled. Without this, survey requests do not include
> any 6 GHz band results, leading to failures in auto channel
> selection.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


