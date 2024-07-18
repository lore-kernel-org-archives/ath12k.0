Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C92C3DA60
	for <ath12k@archiver.kernel.org>; Thu, 18 Jul 2024 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bc9ugXQlqLQLIrSgwE9djiJl9r08FiBdmisRIbveOuc=; b=EGdqaNqRHyblznAfUSl54zdg4p
	2rgyBxcilQiTm7xCfeqfvgMMJ/AF4ZBCdgTBtxhzz0nFB2MCZ4z8dAXY7exfeGL9bzIWC4YrWZunz
	AyJINuEHF/SB0gOPWA1Fv/RccqTzs1ehI4tQBqHiU29JPitV2cjvE+G2gDNpXWdV3d3pYY/g8PT/f
	mzG5oERZCqeqZhWvH/VjZLbMGP/2BzEythyznTe42Ss4tFmlICcQl58ITII4b4w7dwIf7fYhtf9bY
	DV0wOz7LfZ69+Ku/KdfDLoJywyc5RT8654DxgPQa/8sO7a2c1JqAUiwMe3o3rTcHH/hMb5P11Y3iK
	4uy5Gkxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUGmh-0000000FWYF-0xKq
	for ath12k@archiver.kernel.org;
	Thu, 18 Jul 2024 02:22:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUGmf-0000000FWXU-02ac
	for ath12k@lists.infradead.org;
	Thu, 18 Jul 2024 02:22:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HG5YY6029174;
	Thu, 18 Jul 2024 02:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bc9ugXQlqLQLIrSgwE9djiJl9r08FiBdmisRIbveOuc=; b=QvEXAGW8NNftIzpq
	XAP1VTbcJTbbDfESef+cLEEyvPaNGqJNc903JNtYCzedkx4OzKJPvB7lR2YlWwBh
	WMPsU/tVbdn5dyHMeZpNCllBir1DFKEHNwKMw4KNFt//syAYEAkd1yVRks5v6Glt
	agxom7FXO5E8R/7cnjGg9j4jiwSKmoMBQkXGf0RG/l+OeYNL207q589uIh9veWKk
	QSxTWDyg5LfGMhJUBht9c7jJ/RfcpKzRsRo8REBOAsGGvSnm0Cq32gUuYFq1OaG7
	HeC59SkGsI332Ysd8kJ+fRLyiLo4MOrpaqNb1MOCvLbDC/g3l+9JtPBnmTOREwPh
	oCNZzg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1m4jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:22:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I2MCvt026575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 02:22:12 GMT
Received: from [10.111.167.25] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 19:22:04 -0700
Message-ID: <cc711aca-acaa-401b-b8ea-40252b1f9207@quicinc.com>
Date: Thu, 18 Jul 2024 10:22:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling
 specific features based on ACPI bitflag
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        kernel test robot
	<lkp@intel.com>, <ath12k@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-wireless@vger.kernel.org>
References: <20240717111023.78798-3-quic_lingbok@quicinc.com>
 <202407180403.SFqsPj0v-lkp@intel.com>
 <16d70523-dd1c-421c-98bb-8bd6ff319a6f@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <16d70523-dd1c-421c-98bb-8bd6ff319a6f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b-62bZ-j-I7d2vp-g8AMWbK6DFE3omAn
X-Proofpoint-ORIG-GUID: b-62bZ-j-I7d2vp-g8AMWbK6DFE3omAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_19,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407180014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_192217_092771_52D0AF59 
X-CRM114-Status: GOOD (  16.99  )
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



On 2024/7/18 5:44, Jeff Johnson wrote:
> On 7/17/2024 1:36 PM, kernel test robot wrote:
>> Hi Lingbo,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on db1ce56e6e1d395dd42a3cd6332a871d9be59c45]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-Add-support-for-obtaining-the-buffer-type-ACPI-function-bitmap/20240717-211701
>> base:   db1ce56e6e1d395dd42a3cd6332a871d9be59c45
>> patch link:    https://lore.kernel.org/r/20240717111023.78798-3-quic_lingbok%40quicinc.com
>> patch subject: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling specific features based on ACPI bitflag
>> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/config)
>> compiler: alpha-linux-gcc (GCC) 13.3.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202407180403.SFqsPj0v-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/net/wireless/ath/ath12k/core.c: In function 'ath12k_core_rfkill_config':
>>>> drivers/net/wireless/ath/ath12k/core.c:33:15: error: 'struct ath12k_base' has no member named 'acpi'
>>        33 |         if (ab->acpi.acpi_disable_rfkill)
>>           |               ^~
>> --
>>     drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_copy_eht_cap':
>>>> drivers/net/wireless/ath/ath12k/mac.c:5488:19: error: 'struct ath12k_base' has no member named 'acpi'
>>      5488 |             ar->ab->acpi.acpi_disable_11be)
>>           |                   ^~
>>
> 
> Lingbo,
> looks like you need to have support functions in acpi.c with suitable stub
> functions in acpi.h for cases where CONFIG_ACPI is disabled.
> 
> You cannot directly access ab->acpi outside acpi.c
> 
> Nice catch kernel test robot. Wish I had the resources to run every patch
> through a large number of build configurations!
> 
> /jeff

thanks a lot! jeff,

i'll change it in next version.
When i checked these codes using ath12k-check and smatch, these issues 
did not appear:(
Out of curiosity, how can i set up a similar kernel test boot locally?
i can avoid issues like this when sending public reviews.

/lingbo kong

