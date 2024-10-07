Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3541CFB449
	for <ath12k@archiver.kernel.org>; Mon,  7 Oct 2024 15:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IqTxEhawrs7UQJGbNOLxNk1YbqCgjLkZUyV0nVuHG+k=; b=2yy+P/S5iEfrPsnefeUEGh0ITY
	1b6+Lzf5jecua3UImDJ2fghGAaopfnDdVU7VZPc7hXtlS3y7Mm5Mc4lEA9MDcRvhXCMVtoUrynHO4
	YEdIXk330pzW02stnBwTfVgfHklniSqhrInMmvumQ3Bj4BeXkBWW87SUo405CRndXeav/yQlNnQpl
	uO8Og8wgLEDUMs/a3VP+bVBLbui8wpabwYegyaHg9QXkdG3e3Z+Z+QeIB4Ne3NOZwFQ3aETMoWgKB
	7tOysiiIKtZGrijsPQoAyw8lLqE7smHPBzSX9QjrvCJIkvxnOu4qypk7AbVdACA7L/9NF14d5nVbr
	qzT+XXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpqj-00000002zQT-1SVH
	for ath12k@archiver.kernel.org;
	Mon, 07 Oct 2024 15:40:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxpqg-00000002zPY-1riJ
	for ath12k@lists.infradead.org;
	Mon, 07 Oct 2024 15:40:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 497EQi3e026049;
	Mon, 7 Oct 2024 15:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IqTxEhawrs7UQJGbNOLxNk1YbqCgjLkZUyV0nVuHG+k=; b=h8/ArshJ4Yx1TbM8
	VW7ej+9MhzF9NmKp5lvBpCt1bwYC109B1/YlbUbXpN3AEAwiol4dp067UlLJJPED
	40X7Rz+NsREP0f423jVFATS6y+0S7dn6ejnJV8MSLUDQF1SckLcqYZga9uiKu7r5
	MfgRurSvPgfqbb10g/6yP6HK4bH/CWu/utRxAvxUDGVjTQboLtBqy9dxUg4g5EaY
	oPU6sIGWFBZajO5b6RI5UXGDxQ+cA77KnkSlRGSbMFH7WuhP7YFhVctfo5GCiEZV
	A7Kv+74nSIEi7Ceulyrr3u80rkUFfpI9GlRp7i8hUTVAPfKnjrV4gegQnwv5GCIu
	iJQ/Tw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xtb4na1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 15:40:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 497FeWX1012968
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 15:40:32 GMT
Received: from [10.48.240.101] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 7 Oct 2024
 08:40:31 -0700
Message-ID: <9db6842d-ddc6-4f0e-a818-c13298eedd8b@quicinc.com>
Date: Mon, 7 Oct 2024 08:40:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ath:pending 8/12]
 drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left
 shift count >= width of type
To: kernel test robot <lkp@intel.com>, Rajat Soni <quic_rajson@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jeff Johnson <jjohnson@kernel.org>,
        "Kalle Valo" <kvalo@kernel.org>, <ath12k@lists.infradead.org>,
        Roopni
 Devanathan <quic_rdevanat@quicinc.com>
References: <202410040200.Mwb85JzQ-lkp@intel.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <202410040200.Mwb85JzQ-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Qis-msQnFUAn6eKybd6QDmefT1srU9Zk
X-Proofpoint-GUID: Qis-msQnFUAn6eKybd6QDmefT1srU9Zk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_084038_634434_5730BFF4 
X-CRM114-Status: GOOD (  13.36  )
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

On 10/3/2024 11:37 AM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending
> head:   08dd5d93509f962500dc983864b4effb2600831a
> commit: f6a46bc3719cc6b445cb071a7dd6968891ffb169 [8/12] wifi: ath12k: Support DMAC Reset Stats
> config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040200.Mwb85JzQ-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410040200.Mwb85JzQ-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c: In function 'ath12k_htt_print_dmac_reset_stats_tlv':
>>> drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2515:77: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2515 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->reset_time_hi_ms) << 32) |
>          |                                                                             ^~
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2519:81: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2519 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->disengage_time_hi_ms) << 32) |
>          |                                                                                 ^~
>    drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c:2523:78: warning: left shift count >= width of type [-Wshift-count-overflow]
>     2523 |         time = ((unsigned long)le32_to_cpu(htt_stats_buf->engage_time_hi_ms) << 32) |
>          |                                                                              ^~

Out of curiosity is there a way to tell if this is a 32-bit build vs a 64-bit
build? I just want to verify that the issue is that unsigned long is 32-bits
and not that the shift occurs before the typecast


