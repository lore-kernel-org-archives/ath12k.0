Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08EC3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktr3F/0ll5pGSstdBLfF8aSAgyf6XhIrbvnXSTufpj4=; b=rGSykPlTjtPm4fF84Iix05CtO+
	oHJD9cAEhslScrUhx/tEg6Expfy/Gq/AW1rrOkYzUnCxNrsnBmgJpzNzQM050WcjhBlr5qpHPyBu/
	Y3nD+lj6b5vmgXolGmru+0gXolhSFSUcaxbnZiDX1yr6c3q2BoYtMXMKXLxDFsUF2v0TowTp0OW/m
	wVhyy8EozH5R2dE1f8OQ3FzJQ4F5QRJ4iAt6K7MVzVcAd0ybvL1f9OT/JAhYW/DgfyHwsrbuKLuaI
	n7D3YnXdlW/oyR+6REX4z2X1gGdE3dGrVi05G1+dBH4fRFCrsSqM4MaXe86IkFFQ2rzhslSeEleCh
	o+rbHFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5A5-00BXue-0q
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 17:36:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL5A1-00BXtY-16
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 17:36:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403FfeSL008078;
	Wed, 3 Jan 2024 17:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ktr3F/0ll5pGSstdBLfF8aSAgyf6XhIrbvnXSTufpj4=; b=n/
	eUC89W8GSieNjnlBrcavXFScWRNk3rhumq+D81YdS1dejOA1JZLnl7E5BLDCs7TK
	rQ1mI/nTwTuo1URgsuWshf7fFZYlKXhDdccqYVlXgPxhUpcKVwz9bkl3N3b4VZiy
	DXGMUoQgQf1Fhxp+AsNcQNbhn/ti5qgch9qfTViyDkAZEn3I65UgL7vYpXrKribH
	9BPlHtLtIeuhN2VUqykFTuG9WVTIh/wB4jlp28IDOoe0XIdvCawUE4swuMMSOrS4
	/IcHbCszJxRdy7M5PPz9Ue0oehNM0oqvqj1PwWZlOQH/TbsTe9CwjEGw/w/XpqbG
	QZqWtCZ4Vmerx+Mgyx2w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd34s9f21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 17:36:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403Ha6Mb015763
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 17:36:06 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 09:36:05 -0800
Message-ID: <b0269bc8-0c32-4376-8413-06cecde7d16d@quicinc.com>
Date: Wed, 3 Jan 2024 09:36:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] wifi: ath12k: Refactor mac callback of ampdu action
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
 <20240103063731.3356060-9-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240103063731.3356060-9-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -pSVtHSMn7wL-Qf6bh1gFHuCKSfB49NJ
X-Proofpoint-ORIG-GUID: -pSVtHSMn7wL-Qf6bh1gFHuCKSfB49NJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 adultscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=296 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401030143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_093609_495533_06032A72 
X-CRM114-Status: UNSURE (   5.83  )
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

On 1/2/2024 10:37 PM, Karthikeyan Periyasamy wrote:
> To support single wiphy abstraction, introduce link/radio specific helper
> function in the mac80211 callback ampdu_action(). This way, the callback
> can be extended to handle multiple link/radio in the future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



