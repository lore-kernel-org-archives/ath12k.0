Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7572AC25B74
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 20:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rjROZoOIrnZtivCUkzuskaX4DsIWECiBSFOvDFmAoU=; b=1xbAN9/BrzM4NtreXxoQy6IJ8k
	x6v4w7SYr+sexzqTEdkLAgh5FNmEeQtaBQDINZ1tHFGKJKaN0PNEozlWWbeC9sEvmareelefDDCCd
	qv7pnyBRMUu2oUyK3slqzh81qUKGt1Xc1hqrdq7DPDQPDGc11DijJLTBfrJwr1GHxQ0y7OgDA6eOY
	M7uSA3RLz+pTpjRlUYaBJBVW1GiKoQlUsNg9BdktHt2Og9IxZLA0AylpsdWiKYrEEGDvxCKn3tZ4G
	PS20AipZEub/1v8qgjz78nzeuC3AUQfHLCud5crJRAcszjr3U+Z2sZXTSdSHWikzilp2jNK/cbb2+
	TzyqYscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9W9Q-000000011Pv-0c6A
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 20:32:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9W9N-000000011O2-2swa
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 20:31:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAIEaG015601;
	Tue, 21 May 2024 20:31:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=8rjROZoOIrnZtivCUkzuskaX4DsIWECiBSFOvDFmAoU=; b=UD
	r97izCgg1+Xaolae5+2Qn317hRPuoJZVhGSkhp8Y3rhphpYhjxhGCT1UnVoMwAAe
	zHlFa5LMQZqih84IykIcluE2EsSktgMrNhjaKdPcZYWnLWYzvEAauOv4/Ed2Ac8M
	4qpgxRl+E6n2kubwbhI8o+xIbXZ90bRiviLy5DGsFg0freH25XqED7iseryEGSoK
	Q92K2ddvH3flhQ8mN3mBX6pN5uBmkrcxNUVudWCreLSaQkSB7cpmQKqFyaP5ojPo
	Rb7ey/wvx8QG2dUCaFwKVy2w5EyUIYRkgXPnw+3nQRHuLTSNiskwb+mxzi5UE7Jr
	YNNHWWKFP5QZu1uqdGBg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tfp4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 20:31:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LKVprG026643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 20:31:51 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 13:31:50 -0700
Message-ID: <1ef34fde-d7a1-4a17-b0a9-d3bc2ef71058@quicinc.com>
Date: Tue, 21 May 2024 13:31:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: board-2.bin
Content-Language: en-US
To: <pgupta@hindutool.com>, <ath12k@lists.infradead.org>
References: <1716180196.ixiafmuo0wckk0ws@mailapp03.register.com>
 <87seycerlh.fsf@kernel.org>
 <1716221937.24ib38wrkkgo8sc4@mailapp03.register.com>
 <1716224337.zi1iti2l1c0cocko@mailapp03.register.com>
 <LO0P123MB40578D0BBD3B6EDDFED084ABD6E92@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <1716242767.t9j0j77jn6sgs4ws@mailapp03.register.com>
 <LO0P123MB405723C63196B6A2D87EAEB0D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <d3aeb02f-4a1e-1388-8206-066e5d352e92@candelatech.com>
 <LO0P123MB40579A82B572982CDCFD8372D6EA2@LO0P123MB4057.GBRP123.PROD.OUTLOOK.COM>
 <1716276697.fqsmqowkhwocwgg0@mailapp03.register.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <1716276697.fqsmqowkhwocwgg0@mailapp03.register.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EHN30H6fi12ngWC4WpWf2PDUNEhjXTof
X-Proofpoint-ORIG-GUID: EHN30H6fi12ngWC4WpWf2PDUNEhjXTof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_12,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_133157_891334_C02E6F62 
X-CRM114-Status: UNSURE (   9.42  )
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

On 5/21/2024 12:31 AM, pgupta@hindutool.com wrote:
> Lastly I have a question.  Which repository should we use?
> 
> https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main?ref_type=heads
> 
> OR
> 
> https://github.com/quic/upstream-wifi-fw/tree/main/ath12k-firmware
> 
> and what is the "qdss_trace_config.bin" file located in the upstream-wifi-fw repository?

Use the first one:
https://git.codelinaro.org/clo/ath-firmware/ath12k-firmware/-/tree/main?ref_type=heads

That is the only one that is tested with kernel.org drivers.

The second one is poorly named since it is only for use with the QSDK fork of
OpenWrt. So the answer to the second question is that it is used by QSDK and
not needed by a kernel.org driver.

/jeff

