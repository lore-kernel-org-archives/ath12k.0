Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DC2C4332F
	for <ath12k@archiver.kernel.org>; Tue, 31 Oct 2023 01:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpD5O9OF31UVUtD5Eb+dSyeaIByUhydr49/wgER+VW4=; b=izXPcwAYPknuzo
	ekneOOdfOr/jz4EE+4HDfGZLEjmNBBxR0LNGjHbkjUUYXBndKgoXukaLqKNfLrigBuR3cLZQ2Pgq8
	zBEhYxRU2CfsyZyFt8VH+SjhQOPn3Ujd6v5mdEHPj0G7gfkRba/ioCA3KbLGP/Zxb5qqP1KtqRPQR
	yWu3bFFs0UGJTlUWj7PbvYWyJOVpx/2tvDYZwkdmTd4qgr+ccYyCn9S4dNDF9HTJ98OyVibJYMPtb
	MBTnnE2f4Vl6X7Q+6eK2iXnbMdZpu1fr2V+3k1gQ2r66R+vEbdVd/ynRdPxFRWfK5XxtCA6ZWpGUr
	6VXzKwnuGPqScmImxrpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxd8Q-004KJw-12
	for ath12k@archiver.kernel.org;
	Tue, 31 Oct 2023 01:01:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxd8N-004KJd-1n
	for ath12k@lists.infradead.org;
	Tue, 31 Oct 2023 01:01:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39V0j9PV012095;
	Tue, 31 Oct 2023 01:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NqpG0HY9NznEIOYNaUGWpcy0PLVZ80Mu2FaWtICuwXg=;
 b=b7JSPkfI+w3Lg6WBdd6J5hYY/xsYGNJdOEdb+gr7cLqETa4X9dmVWuWq9B4Kxe9dSgt9
 ccIcR3OdFYz/w14LS/L05ycE0LazT2fn+t+pbCV/uI9PhQ794TRP0QQsw2oIdfOqKuEz
 Cv34d6vPdUuJbwdfmvOGFchUL7ZeXExvbWl/yV3Wa+w4BVKHPjmUb1CjrTzIyfupOY/z
 r7VQC34IGpj9/3fqtPkeeH+4YLg/CB7VY2yuIThs4kEhcLrL1Ss99b+iCWcQ2h7mtTCA
 YTA6SBefKU3f4mtu/HY6cpSzpFGChCkTKJHXCNN5o95rBq9qI+PFylPfkWihA3LLV/ZE RA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2b2qssgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:01:30 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39V11Tnq005145
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 01:01:29 GMT
Received: from [10.48.245.206] (10.49.16.6) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 30 Oct
 2023 18:01:29 -0700
Message-ID: <6bf9561d-6fa4-48cc-bfc0-59534bd7d6c6@quicinc.com>
Date: Mon, 30 Oct 2023 18:01:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] wifi: ath12k: add MAC id support in WBM error path
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20231030222700.18914-1-quic_rajkbhag@quicinc.com>
 <20231030222700.18914-12-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231030222700.18914-12-quic_rajkbhag@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qU1i7SQBEalOkERIoyCdf7C_Kb5p0mld
X-Proofpoint-ORIG-GUID: qU1i7SQBEalOkERIoyCdf7C_Kb5p0mld
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_13,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 priorityscore=1501 mlxlogscore=801
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_180131_714007_FE891C0F 
X-CRM114-Status: GOOD (  13.64  )
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

On 10/30/2023 3:26 PM, Raj Kumar Bhagat wrote:
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

based upon the code it seems this only works when compact descriptors 
are in use? IMO that should be highlighted.

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
