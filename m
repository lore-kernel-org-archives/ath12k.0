Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D5DC4345F
	for <ath12k@archiver.kernel.org>; Wed, 17 Apr 2024 23:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x02ZDWx5MN0ifScQ0Ni8CJ8JzOiftRVCoF5P62HLbD4=; b=SSRjD2qOS8qf+lWLsj7iSgb9xA
	exrRsBBl/Ldwfc+Fa9Rs9Cw+QSHjle0Kj0u7qYawGNVlv1UBVzn4+G43o5r5tBtSgYkSRiZmpfvi7
	yopiT88lWpnw0Sw4lRNjsdyjz7KTAcOmD1+bvgQ9E5nlru0uAWxAxs7ffmvqemLKfN8Al08hYiPNW
	MEcBMeBlDPHLTrdTwx/YSHEm2zXRpEdfxo9efTM4KiZ3nry9hdy4mkJc33lOP3Rm5hJ8bXtwaKxXm
	EA7fneLGJuC81JnOsYHFogCDLvqCdAL60ezCxfRKk0Wd+5xcKTBTVOFZpn3hAx8lfJ13XvAJW1WNm
	R7PrJQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxElr-00000000JP5-1ubl
	for ath12k@archiver.kernel.org;
	Wed, 17 Apr 2024 23:32:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxEln-00000000JOF-3RHy
	for ath12k@lists.infradead.org;
	Wed, 17 Apr 2024 23:32:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43HNO2Hg000700;
	Wed, 17 Apr 2024 23:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=x02ZDWx5MN0ifScQ0Ni8CJ8JzOiftRVCoF5P62HLbD4=; b=Hj
	pJzUD61eu/iqA1ITbfJqokpNtdCgkvYP1ACowKWFeY+hv0K0AMlTKw7GUTq6ofRx
	5VKaRbbebc7ZgZUpuqEpBHBFnv22C1XBjC7C2R5eSR20JTcZWtuftFWCk0BX709h
	ydKf15+LfPrJQt3/oiRauwmeb7fOojucmdho+Oa4PZUbp24AvqVHnxqfPn/5qMfv
	6MKbL89e8lg3oGTKwMLQKIlFUzohQM173stpltMmuPKZUaDvgckKclYS/5zOc3Z/
	WBjAYidLcRwJn2HsC2k/Rg2iPim6bYmuAGeR7IL79g7vi7BSqLwCxfg7H3rWClOG
	OI+VknJLcziD1E5x2MwA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xjm0s0hbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 23:32:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43HNWlW9017008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 23:32:47 GMT
Received: from [10.110.20.198] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Apr
 2024 16:32:46 -0700
Message-ID: <b428c741-adbe-41c2-b353-a74b574d12d4@quicinc.com>
Date: Wed, 17 Apr 2024 16:32:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] wifi: ath12k: support suspend/resume
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <aea9f68d-4862-439c-a52f-d6463e6edca9@quicinc.com>
 <87r0f4vzkc.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87r0f4vzkc.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qMg67F_-5CYebpAY4RBMLUOBF1aAT_UK
X-Proofpoint-ORIG-GUID: qMg67F_-5CYebpAY4RBMLUOBF1aAT_UK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_18,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 impostorscore=0 mlxscore=0 mlxlogscore=617
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404170168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_163251_898064_C40F5F5A 
X-CRM114-Status: UNSURE (   7.85  )
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

On 4/17/2024 7:22 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> My Qualcomm Innovation Center copyright checker reports:
>> drivers/net/wireless/ath/ath12k/dp_rx.h copyright missing 2024
> 
> I fixed this in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6b928df55a671d2c9a15edc746f6b42ef544928e
> 
> Jeff, what do you think of the patchset? Is it ready to take?

My laptop didn't boot with this patchset in place, let me debug.


