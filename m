Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0ACC48BF6
	for <ath12k@archiver.kernel.org>; Mon, 26 Feb 2024 18:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EMWU6TjUgTFNUJJWPrlwfz6A2PrP65e00G+YbvqB0SI=; b=J9OWZ+POmgtqWAnnt3OZ3oYlGq
	IvPIXjz4zB1vj8Hjj8BEo10jGXv27xhaWMFrv8LteSTEtnCmnjLDpZrB54uL5tySGfi+zBFWl9nlm
	Bk8bTpk0pefP/anx/hk8OebrHJBNH5iw/o+10KEjXewFew+mcDG0KsSfAwinub31d/Kn6Z7p6+5by
	Mf+4FB7JPa23j1efzyvrBCCyJtmxOAE/6RjFImJ6+jolKEXv/8BmSEGS9KEdqPYlaC4LTxiGb+uNu
	AtjFO1XQzvL4v+5dt4rK7Jgs2XiOj1rekAU552kIXuzT/z5ws8YN66HVsUorN56Hu5ggz4md+e9A8
	3vBNf6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refme-00000002C8B-1OFa
	for ath12k@archiver.kernel.org;
	Mon, 26 Feb 2024 18:33:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1refmc-00000002C7a-066v
	for ath12k@lists.infradead.org;
	Mon, 26 Feb 2024 18:32:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41QF8Jdg005073;
	Mon, 26 Feb 2024 18:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=EMWU6TjUgTFNUJJWPrlwfz6A2PrP65e00G+YbvqB0SI=; b=mW
	CZzWwxdF6qkF+Hd4JxLGl07AZthUrDmbw634N5nYLhv7wxRbmNGjgxE681mf1Chv
	OVQTfe+texfBz7ohr1awh6hoSIKCTesRLZV+zbJhYwFxK1B0LcDd6fCpYZLDfzXQ
	E5QIO/r55ONMMz6+0J1cGw5i8HGUgKtmxndkl40b8E1rzkI2jRxTJfgLWE1LgEZg
	75H+TVv3LVmum21asvy6TlAN5DjfVdyAqZ/+0Lt4UL4WPz9wjGvBPrex2css6lRp
	tDQJY9pijZPmszcnjMNcTAnZWY5ze6ARBQpY6GmRwHLV7fTAg28QfGTRZGxBgsZV
	bo7rk2pMQyqiWI17Ov5A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wgkxmhsc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:32:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41QIWtRa019642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 18:32:55 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 26 Feb
 2024 10:32:55 -0800
Message-ID: <1eb47a6d-dddf-4bfc-8ee5-b47dbb87736c@quicinc.com>
Date: Mon, 26 Feb 2024 10:32:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] wifi: ath12k: Refactor Rxdma buffer replinish
 argument
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240226162310.629162-1-quic_periyasa@quicinc.com>
 <20240226162310.629162-2-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240226162310.629162-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3Vqbm2D_XmPpWlYtFmcQ_VPWkCRWNt_O
X-Proofpoint-ORIG-GUID: 3Vqbm2D_XmPpWlYtFmcQ_VPWkCRWNt_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 mlxlogscore=566 impostorscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_103258_103678_4E44407C 
X-CRM114-Status: GOOD (  10.82  )
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

On 2/26/2024 8:23 AM, Karthikeyan Periyasamy wrote:
> Currently, the Rxdma buffer replenish procedure implicitly retrieves the
> number of free entries when the caller passes req_entries as zero. This is
> helpful to replenishing the Rxdma ring when the caller is unaware of the
> number of entries to replenish. After the Rxdma ring is initialized, we
> can pass req_entries as zero to replenish all the free entry in the Rxdma
> ring. This change helps to align the argument req_entries to the used list
> entries for better code readability.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


