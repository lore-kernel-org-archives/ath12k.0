Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA25C55178
	for <ath12k@archiver.kernel.org>; Fri, 20 Feb 2026 09:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFygskVWcOk/FNfbcnCRmtfmSQU7zntYpcO68PJi84k=; b=vThkuKObU/4JdMksAghC6eR/ex
	584SvB/+IG7qUlj+eLbp6YW99zlXuvbrEWCp3KN+rVyexJr0ti7LVs7R4xGnPnh1ZCgVGw3gGq/Aw
	pVi1q0Kr+v8M23gUpPJqctySNM7es2j3M8JAE7+He4XnPidluyVVrpf0rgW458UQ5vYoaFc+RBEvo
	SjyYZalsjZs73f4Y5PwS6uRANq8iw9dACNJOgldhUXL8yI0AnxQae9T+R879iWaXQMXEljpzoXthI
	ijVkBzGeSTDYQ1KqIT5DBIa1WWQcgbAyVpMKcKWRQlPV/SdsWivNCi7nNBnnIrw0iEWNowin4ulm/
	MaCZbBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNEO-0000000Dhuc-14lT;
	Fri, 20 Feb 2026 09:55:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtNEM-0000000DhsV-1jSU
	for ath12k@lists.infradead.org;
	Fri, 20 Feb 2026 09:55:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RmYH3697705;
	Fri, 20 Feb 2026 09:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFygskVWcOk/FNfbcnCRmtfmSQU7zntYpcO68PJi84k=; b=iSG57pz/HT0xOiKX
	HOETaPZfU/SS0ET13aa4g7ylQtJLtl1oiFpSR1dbLhpnpYh4YejRywPvddReuyOv
	RoJ0Zx0g+iM9H+nUxWtH8TauubaU2TVXCwWni/a0SJ9JvT7QIoYq5IjbyQZsi4NS
	coWQ2zQKPDnR+NndhrgQZ0hXvSan9XUIyQw8Xl4iH7Vnt/ylReejgwXL1vYi5VXS
	TW4Q7/LkERIwpKASkFRGZ49r9b2Z1kXptxqX8bBKryzJcZ+IUG/dj9OAUs8iQ9Ng
	p8ZucjZG4ltiQj9okHMsaMw9bE0mFXLB2uY2yfxaIiVURBkUDPVNGYTcQAAFjuqo
	Tvn31g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ceh5jgnp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 09:55:25 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 61K9tO3Y027491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 09:55:24 GMT
Received: from [10.152.205.141] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 20 Feb
 2026 01:55:22 -0800
Message-ID: <939f1f6a-ec52-4acf-8d8e-1ae81e2d9008@quicinc.com>
Date: Fri, 20 Feb 2026 15:25:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Maharaja Kennadyrajan
	<maharaja.kennadyrajan@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aishwarya R
	<aishwarya.r@oss.qualcomm.com>
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <6d8849c2-a58c-4aea-863f-6e4c335ea4cc@oss.qualcomm.com>
Content-Language: en-US
From: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
In-Reply-To: <6d8849c2-a58c-4aea-863f-6e4c335ea4cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Raedyltv c=1 sm=1 tr=0 ts=69982f8d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Mp5vFCwjDu8Sjic8cMYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4NiBTYWx0ZWRfX1B7REW+zeAIo
 oAc0tK6QTelgoybMasalmhx6dkodDVqALRZqMh4QLNv8fRajX53Hs22WHZEXkKA16/VKs40IEUk
 3RBLly1zLoe661tUoTA+p284enzEyBr2qMhakO3BY5zoqVpZt65HriSmTD0eDMr+XAUskqWKXj3
 m5AY3KCGw7zfiI7q5SmF1yLZjDCO533cdZljQgWyDONKSJ2cbm4t0J9VuSluBWyItOcS0p7CmFj
 7VpkWeao9y16KQwF85HGhoxFLHcS+0NFOvSFRiBBA7S8f9XuZ5wb5U4xA6Tvjxfrfq4QiAtrk+N
 uivaxv9vrViTdEbq6A+KptYFpw9ftCYnxm1v3CT0hIl8kzvi+i6MDD6zniv7dkJ5KDPduHJyCkj
 rVNfMoSNeM6aMcthk4srbJEmJbuwy/QYwp57MtTp6n1uvceE2UY1+C2ELIxtuL8CIOtJUFyL8YU
 0uIcc+gNFzYlZwl3uQQ==
X-Proofpoint-GUID: 1vBHfxwsVif1HQ5bW1hl6LPvE3EyxOSP
X-Proofpoint-ORIG-GUID: 1vBHfxwsVif1HQ5bW1hl6LPvE3EyxOSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_015526_573161_5919DBFE 
X-CRM114-Status: GOOD (  15.12  )
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


On 2/20/2026 3:14 AM, Jeff Johnson wrote:
> On 2/18/2026 11:34 PM, Maharaja Kennadyrajan wrote:
>> +int ath12k_thermal_register(struct ath12k_base *ab)
>> +{
>> +	struct ath12k *ar;
>> +	int i, j, ret;
>> +
>> +	if (!IS_REACHABLE(CONFIG_HWMON))
>> +		return 0;
>> +
>> +	for (i = 0; i < ab->num_radios; i++) {
>> +		ar = ab->pdevs[i].ar;
>> +		if (!ar)
>> +			continue;
>> +
>> +		ar->thermal.hwmon_dev =
>> +			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
>> +							  "ath12k_hwmon", ar,
>> +							  ath12k_hwmon_groups);
> ath10k and ath11k use devm_hwmon_device_register_with_groups().
> why doesn't ath12k do the same?
> then the code below and in _unregister() that calls hwmon_device_unregister()
> would be unnecessary since the objects would be reclaimed when the dev is
> destroyed.


ath12k_thermal_register() loops all radios and devm-registers hwmon devices. If registration fails for radio N, it returns an error that bubbles up and 'ath12k_core_pdev_create()' unwinds only DP ('ath12k_dp_pdev_free()'),
while already-registered hwmon devices for earlier radios remain bound to `wiphy->dev` via devm. If bring-up aborts (pdev_create fails), those hwmon sysfs nodes may persist until the 'wiphy' device is finally destroyed,
which can be much later or never if the bring-up stops early. It will impact resource/sysfs leak window and possible user-visible stale hwmon entries in failure paths.

Given this, using hwmon_device_register_with_groups() plus explicit unregister keeps lifecycle handling predictable and aligned with ath12k’s recovery paths.


>> +		if (IS_ERR(ar->thermal.hwmon_dev)) {
>> +			ret = PTR_ERR(ar->thermal.hwmon_dev);
>> +			ar->thermal.hwmon_dev = NULL;
>> +			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
>> +				   ret);
>> +			for (j = i - 1; j >= 0; j--) {
>> +				ar = ab->pdevs[i].ar;
>> +				if (!ar)
>> +					continue;
>> +
>> +				hwmon_device_unregister(ar->thermal.hwmon_dev);
>> +				ar->thermal.hwmon_dev = NULL;
>> +			}
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +void ath12k_thermal_unregister(struct ath12k_base *ab)
>> +{
>> +	struct ath12k *ar;
>> +	int i;
>> +
>> +	if (!IS_REACHABLE(CONFIG_HWMON))
>> +		return;
>> +
>> +	for (i = 0; i < ab->num_radios; i++) {
>> +		ar = ab->pdevs[i].ar;
>> +		if (!ar)
>> +			continue;
>> +
>> +		if (ar->thermal.hwmon_dev) {
>> +			hwmon_device_unregister(ar->thermal.hwmon_dev);
>> +			ar->thermal.hwmon_dev = NULL;
>> +		}
>> +	}
>> +}

