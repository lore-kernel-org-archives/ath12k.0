Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607E5C3DA60
	for <ath12k@archiver.kernel.org>; Wed, 17 Jul 2024 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1GDm1wv+04pURSXjtO9bIW6LswSWYfYOThmkzLLwWI=; b=lRZzIK+el4YFX+GVQa6zHOFi0o
	twJQZUl8G3MAP3uhpSObPCmkEAcjZ9ZVF9hJnsHQmsx2bYoV8QZD2GVDC1iCfvKPyNoypFHuX5GZA
	1paKa+dVlICIFshya/I2cwsINjp53OPYhM9ILXcad/QTGJj3wkL0tbP4LlxJEzngR3D3eCvvu0Hj/
	OB1zFEDOUefm9KE/xaOo/xsfHxl8SJ/zWYbQEaKnTjjBGq4Wy9IZiKKP2QBv0fC6TszMvDafWZbEp
	YRQyF9GN/isk7HDax/pyvGqItXAmCnl7rjMoAMnQel2KSsNsHDxjQQFebQr4t0OxIyhdxaY64BJs8
	WXIgAOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCRg-0000000F0lY-0S5K
	for ath12k@archiver.kernel.org;
	Wed, 17 Jul 2024 21:44:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUCRc-0000000F0l2-2dJw
	for ath12k@lists.infradead.org;
	Wed, 17 Jul 2024 21:44:18 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46HFUVdX006947;
	Wed, 17 Jul 2024 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b1GDm1wv+04pURSXjtO9bIW6LswSWYfYOThmkzLLwWI=; b=PdfFCG2R9paH1Qxj
	9OUSKwu66dOMc55pTQj3wgQ8UCyBffGymZ/Q+Bvx/Nr5Fb87+mk53LrRMD3lhlYI
	k9esj22N+qNLMlRTGuMLVvpfLgDYAYD5Ax2z2cDXLgl7cXaqd8HmhbgZ7NSyMJfh
	t+x4krDfuiUyiWhnGucYxNdn/YqJezvRccjg/bEb4vJH+64/wRbm3rKBZUdocO2F
	lJUyaVQPP+oahUDt2wZdf5SISvQKmWqTwUaYk5BWcHuQC4D0hkVOq96QVBidnuF+
	JOvF9xzCDeG0CEYNIEd0wASYReIfkIvhEGKSpKv6uK/n6LVDSrDFtT9EdZIUF888
	ZrSVaw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfxbpyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 21:44:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46HLiDfG017125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 21:44:13 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 17 Jul
 2024 14:44:13 -0700
Message-ID: <16d70523-dd1c-421c-98bb-8bd6ff319a6f@quicinc.com>
Date: Wed, 17 Jul 2024 14:44:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling
 specific features based on ACPI bitflag
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Lingbo Kong <quic_lingbok@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-wireless@vger.kernel.org>
References: <20240717111023.78798-3-quic_lingbok@quicinc.com>
 <202407180403.SFqsPj0v-lkp@intel.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <202407180403.SFqsPj0v-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vmka7rreuKU6PxUZVhdV-s8RmdtgEom8
X-Proofpoint-GUID: vmka7rreuKU6PxUZVhdV-s8RmdtgEom8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_16,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1011 mlxscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407170164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_144416_819252_A2BB95CE 
X-CRM114-Status: GOOD (  13.26  )
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

On 7/17/2024 1:36 PM, kernel test robot wrote:
> Hi Lingbo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on db1ce56e6e1d395dd42a3cd6332a871d9be59c45]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Lingbo-Kong/wifi-ath12k-Add-support-for-obtaining-the-buffer-type-ACPI-function-bitmap/20240717-211701
> base:   db1ce56e6e1d395dd42a3cd6332a871d9be59c45
> patch link:    https://lore.kernel.org/r/20240717111023.78798-3-quic_lingbok%40quicinc.com
> patch subject: [PATCH 2/4] wifi: ath12k: Add Support for enabling or disabling specific features based on ACPI bitflag
> config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180403.SFqsPj0v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407180403.SFqsPj0v-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/wireless/ath/ath12k/core.c: In function 'ath12k_core_rfkill_config':
>>> drivers/net/wireless/ath/ath12k/core.c:33:15: error: 'struct ath12k_base' has no member named 'acpi'
>       33 |         if (ab->acpi.acpi_disable_rfkill)
>          |               ^~
> --
>    drivers/net/wireless/ath/ath12k/mac.c: In function 'ath12k_mac_copy_eht_cap':
>>> drivers/net/wireless/ath/ath12k/mac.c:5488:19: error: 'struct ath12k_base' has no member named 'acpi'
>     5488 |             ar->ab->acpi.acpi_disable_11be)
>          |                   ^~
> 

Lingbo,
looks like you need to have support functions in acpi.c with suitable stub
functions in acpi.h for cases where CONFIG_ACPI is disabled.

You cannot directly access ab->acpi outside acpi.c

Nice catch kernel test robot. Wish I had the resources to run every patch
through a large number of build configurations!

/jeff

