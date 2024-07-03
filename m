Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A16C2BD09
	for <ath12k@archiver.kernel.org>; Wed,  3 Jul 2024 14:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1gVsWunLdgoqO2JzetC81lzY+BhT+JSy73ahh5P2LI=; b=1NXIYSVNKIkNmVwsJgIteXVdF+
	D9Y02cuFTaFx0VBC/rDl2Yomvfs2kRqCvQcGzSgasOtw5TQjfLMHEqJFvu20YC7wyjIh9UvaKrh/4
	2haImpdKBWcDoyCwW07piCfvXce9PTe+Nok6ZuiiTulvTwL41/8709XLuo2s5vTsC1E7RbzpZf+np
	S8Fc5bWLnT5a7HCBLeN8+AA82scgL8lyNmZVHhEJUN76suajthC2inZTG2VGO2xp87uz+h6Jm7tEk
	Whhxj436ozUqJ1Ab7hhB4Cf9TuIJsTqdFgjBSKcZVY7yuux+W9RKPYZ7SA9On57ymdOIfLiRzpPpR
	rpQRLZYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0dd-0000000AP8p-2mlD
	for ath12k@archiver.kernel.org;
	Wed, 03 Jul 2024 14:07:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0dY-0000000AP6s-2iUK;
	Wed, 03 Jul 2024 14:07:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4637aobv007719;
	Wed, 3 Jul 2024 14:07:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g1gVsWunLdgoqO2JzetC81lzY+BhT+JSy73ahh5P2LI=; b=LlD9TU8rBySQpyt3
	MIV79xXlqa2vOz8o9eNoXrfIGnazPZd65t6YKE7EcleW6GYHR3Ip1xbF6J3A/Fd9
	xTPTaFJ/Edg3+bVcJvjc6pjw53VSAUEk78gOtLbLAlbFBcAeAS8aLut4XQsPauTj
	YSzyI48crHHeOHwzefmiHkjhg8HFQqvYWXpfuzlJtPD2Xlj+hQfg43OQxF4GejHs
	u/kLb7Ru8zk4842sZnwjENtTzAIpjqkq8ugufRbpwqmQQ62gGklRDm+cMqtHaqtr
	Fh/+GqxjnIId8M4xQ8VvNyT+7Zn0i9ia9Mk2KccVzP3UdPjimdnpf5pF2bSFDfUC
	3AouaQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402996s1vp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 14:07:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463E6xxk028788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 14:06:59 GMT
Received: from [10.48.245.148] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 07:06:58 -0700
Message-ID: <5b98e939-bfea-4a16-a116-5a00d3497190@quicinc.com>
Date: Wed, 3 Jul 2024 07:06:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-next-20240702
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>,
        <quic_kvalo@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
References: <812acd8a-fc26-4611-8a7a-c3a1d6197d00@quicinc.com>
 <87zfqzdkgh.fsf@kernel.org> <87v81ndk13.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87v81ndk13.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SdNsNH-RwkiiEX3lIFFpa_UHykK6-Akp
X-Proofpoint-ORIG-GUID: SdNsNH-RwkiiEX3lIFFpa_UHykK6-Akp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_09,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=2 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=2 lowpriorityscore=0
 impostorscore=0 mlxscore=2 malwarescore=0 clxscore=1015 mlxlogscore=175
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_070708_852818_B5CBCEE5 
X-CRM114-Status: UNSURE (   9.57  )
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

On 7/3/2024 12:14 AM, Kalle Valo wrote:
> Kalle Valo <kvalo@kernel.org> writes:
>> I see a weird warning from gpg which I have never seen before:
>>
>> merged tag 'ath-next-20240702'
>> gpg: Signature made Tue 02 Jul 2024 05:55:42 PM EEST
>> gpg:                using EDDSA key 3F9AD487CCF522D7A21F0C492C15BBA0898CCB7B
>> gpg:                issuer "jjohnson@kernel.org"
>> gpg: Good signature from "Jeff Johnson <quic_jjohnson@quicinc.com>" [full]
>> gpg: WARNING: We do NOT trust this key!
>> gpg:          The signature is probably a FORGERY.
>>
>> It first says that the signature is good and then claims it's a forgery,
>> odd. Is this a problem between using different email addresses or what?
> 
> I did 'gpg --refresh-keys', now your key contains your kernel.org
> address and I don't see the warning anymore.
> 

There had to be at least one issue with my first PR. Glad you sorted it out.
Key management is still a mystery to me...

/jeff

