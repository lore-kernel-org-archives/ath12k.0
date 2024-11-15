Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D4A2D68BD5
	for <ath12k@archiver.kernel.org>; Fri, 15 Nov 2024 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXr4U+oDizqL6akLHE1U0Ed/zREhrqQPv3UoLc5BsmU=; b=egu2bSxQu/IHZ6J9ZDVsbwmRgx
	v+j69dHuZkdb3vm0nfc8Cxx+yXaS2AlnZRrsx7T+WCHiYCowhf+EPOegQUJ7WjRTSnd0tA6SHTbPY
	Rlqh/XOmg8JctbADNS8eqCMuZ9DfCooglUIAdDON2UnJy3wPdCNLD75/t5/87JH685VwaJURNv/s+
	Re3AsPFInwboN/2sNIrxeRVapra7D74e8IFP+xWNet5PR0mHCOIStpQEJ4sWFBFLOWuC08JFmvk1R
	kLLJfAT57sfmj0Vrq32ilTIhW+Ge6CwSZ8Y9mDOWdDGlZu4bDzZppFrP2j5yOaHGZhvBoxI0+QlNa
	s0dJBLhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3Wq-000000047tw-3cqr
	for ath12k@archiver.kernel.org;
	Fri, 15 Nov 2024 21:06:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC3Wo-000000047tV-3kkw
	for ath12k@lists.infradead.org;
	Fri, 15 Nov 2024 21:06:56 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AFHfOJh029684;
	Fri, 15 Nov 2024 21:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TXr4U+oDizqL6akLHE1U0Ed/zREhrqQPv3UoLc5BsmU=; b=eJ0nA1UJMQn7zK3d
	P7aHPuSWkZstFkNNk7O+syGsOTPFYLV3QJvRxWjHFtLeoXOQhie5eEcsGRp9aG36
	AgPPprZ4ZvO62rHtXeFR9CHIUdEVnPJ3VfZT7pIBtuxwUR5CKzkQdA4CdPgpcQWx
	Hcb+gTSytTORTTtDQR9U6PaRAr4InrqXPU7egkxYZgmh/FQNc8k9jAJvAvf/8SgR
	VpknaL60LbMfOl0OVd1gxlj5xV5i+nfYAsAEnAk4NZSYakv/TXMKsdSdK51ZR+et
	nwyhePwq4E80OtoynsXRbzuytlfSt5tzhGz1x3fvG1Re98/xXlqYFDr5WU8+AEwU
	BaiyMw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42wjqammtb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:06:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFL6pMa029416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 21:06:51 GMT
Received: from [10.111.176.23] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 13:06:50 -0800
Message-ID: <433031ef-37bb-4a98-9b98-9ea19c3d14d2@quicinc.com>
Date: Fri, 15 Nov 2024 13:06:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] wifi: ath12k: Support Downlink Pager Stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
References: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
 <20241115062854.1919672-2-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241115062854.1919672-2-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Fjq-X7fxVoZqAZikRukR8BiC_G4zRWqg
X-Proofpoint-ORIG-GUID: Fjq-X7fxVoZqAZikRukR8BiC_G4zRWqg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_130655_088948_A4B96742 
X-CRM114-Status: UNSURE (   8.44  )
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

On 11/14/2024 10:28 PM, Roopni Devanathan wrote:
> From: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> 
> Add support to request downlink pager stats from firmware through HTT
> stats type 36. These stats give paging information like number of pages,
> their timestamp, number of locked and free pages, synchronous and
> asynchronous locked pages.
> 
> Note: MCC firmware version -
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4 responds to
> the event requesting stats, but it does not give any data.
> 
> Sample output:
> -------------
> echo 36 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_DLPAGER_STATS_TLV:
> ASYNC locked pages = 2
> SYNC locked pages = 0
> Total locked pages = 2
> Total free pages = 127
> 
> LOCKED PAGES HISTORY
> last_locked_page_idx = 0
> Index - 0 ; Page Number - 8495 ; Num of pages - 1 ; Timestamp - 4031009360us
> Index - 1 ; Page Number - 7219 ; Num of pages - 2 ; Timestamp - 885379515us
> Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> .....
> UNLOCKED PAGES HISTORY
> last_unlocked_page_idx = 0
> Index - 0 ; Page Number - 7144 ; Num of pages - 2 ; Timestamp - 4032070008us
> Index - 1 ; Page Number - 7214 ; Num of pages - 2 ; Timestamp - 885379512us
> Index - 2 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> Index - 3 ; Page Number - 0 ; Num of pages - 0 ; Timestamp - 0us
> .....
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Dinesh Karthikeyan <quic_dinek@quicinc.com>
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


