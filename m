Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6C6CD11DF
	for <ath12k@archiver.kernel.org>; Tue, 26 Mar 2024 17:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFuU1K+XvNLbuPk2yCfh5GkJriqD5LZzYPybxHBIV4I=; b=lNDopAdk6SodrSptlmIPtBhyS3
	UPLoG+1qJ3Wx/iDPIfsdGw77cjSywAU374biM7vDbL/eVlBM6OGxIKYhXij+C2cSiboa6h0RUU6yk
	6d5AiiancXh78VBsQQ+vbntVQuc9fExnjNqulfTpbGxp0KlIxX5yxxqrTixO3L9e+osJ0a0vMnpH/
	3Hub3PKmxxMi5Kpxx1CtQkQeav9pMfHexXZiQPB7HMZAl9xdFyiDtBICH3Pc128iFSA7wfmYfaWCn
	3Y9Qkn41GJpD4PwmqAiu9TYeKIMkWFk8KaO9snxEQvAx5ssnkGgbadazB8K21ihRxDziPWQ9NVBmV
	nbDhNyWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAkp-00000005mCX-1Xte
	for ath12k@archiver.kernel.org;
	Tue, 26 Mar 2024 17:38:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpAkm-00000005mAw-2jUL
	for ath12k@lists.infradead.org;
	Tue, 26 Mar 2024 17:38:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42QEP0QT008627;
	Tue, 26 Mar 2024 17:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XFuU1K+XvNLbuPk2yCfh5GkJriqD5LZzYPybxHBIV4I=; b=IQ
	HfckXK104MzSf9cU1q3ov/Ws1n8ZvmJMmEZhmDvwaNW4MuttkiW3e11t4+yI2sYl
	NnekuyKIXpCDnxpmyOqCQGcrGcTPdw2GkcwnSH7dg54WiGc6PRBOfcMYnKrv2lFf
	x6h4LuxN9F7BW9GXsmWV7Ow7XMmvdbzu70v6U9dwI/b1PAsm6HWio0wpMXBy/zXU
	fxeT0VK6r13tI7l5tNgVAO3mSGUTvSXSUIbkrnF8c53bSnTQ3pblYoO8M9/wdMto
	Bt1xjuBODudrk/svGtvKkmwqtwTVEAo4+19zhTQD+L+LP/gq38bXQr28ZjQFtLtB
	evs1vBlBUtbNim2KzESA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x403q0jm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 17:38:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42QHcOuH026027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Mar 2024 17:38:24 GMT
Received: from [10.110.10.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 26 Mar
 2024 10:38:23 -0700
Message-ID: <4abad8ae-56be-494a-8fcd-97610f069191@quicinc.com>
Date: Tue, 26 Mar 2024 10:38:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] bug fixes and enhancements to 6 GHz band support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240325212304.28241-1-quic_pradeepc@quicinc.com>
 <877chp81ac.fsf@kernel.org>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <877chp81ac.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7LtH7F2iCwtCUDEFiwttudm75mkM56wt
X-Proofpoint-GUID: 7LtH7F2iCwtCUDEFiwttudm75mkM56wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-26_07,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403260125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_103828_908100_9650B020 
X-CRM114-Status: UNSURE (   9.54  )
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



On 3/26/2024 8:23 AM, Kalle Valo wrote:
> Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:
> 
>> In 6 GHz band, add support for
>> 1. channel 2.
>> 2. Fix packet drop issues.
>> 3. AMPDU aggregation
>> 4. SMPS configuration
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Baochen already commented on patch 6 but in general I don't see any
> analysis how this patches affects (or works) with WCN7850. I should not
> be asking about this for every patch, the analysis should be in the
> commit message by default.
> 
Sure Kalle..
Will address this in next revision.

