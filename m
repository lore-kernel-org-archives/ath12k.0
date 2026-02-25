Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BB4F4BB9C
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAUAXtj0TpegUipm2O3M8vHQ88s1bcphnoolZD2pbd4=; b=kT9c/gj+tZObyYb7uU6WxricfY
	cLMR2OBOkGWpg13mDp+R7SMggtCyqEtGzLY7RuxKJKF1F8badxAn9+GAIslwTACfF1P2DItvIDzul
	63Rwd6tzPyAOtBEPL4H3ACy2kMnCfuF0V83A1jIPwdZ6yhhAmM5MXQ6EucFx0mrdkKmT3uuG92j7J
	dhEgvKU4md67+Mpv27iI87qNJ2X3nN+z4mdvf00/jl6g1AWk/S+q6pbgV63rFJFoQD/wuPLoLeKGy
	awqE887CmJ6E0k/nSjhp5YOMBOTdp5HFqCFSHZVRExXXgMY65BM//cjPkRe6O+oTVfPmuTwUsmmy+
	wlM/Lwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCVH-00000003qOz-1ng5;
	Wed, 25 Feb 2026 10:52:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCVF-00000003qOd-0M59
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 10:52:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TQ8S583572
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 10:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OAUAXtj0TpegUipm2O3M8vHQ88s1bcphnoolZD2pbd4=; b=dshEJyBJiRlm+Sbb
	au26Ge63pu2Jw6FKKM1/wX7JCsXYun9o0xmlCsAzcacvmiIka45TeCwyBFJOeQ1n
	wDcoVdZ4aHEfGVyDCD82yMkMylpO0DYKHFGBm0pVKLW5hZlcQIHM/xgS9tfiNLEw
	QperNFVNKTU3IbePhS+gAH7UTg8W+9TSmmQmbS88vu3SUk9heIynLCzs4XDUB+aE
	9nC9MlYofnRKZ8VO90wMdChMHnrQ2kB3xliYUl/c5ZYVQAz7NnMIY21xA4YrEpJS
	vQx4aX8F0PlaMsxSu8kz1hFDOs1zFeFvhosBzRy37VPZldV/hNe4RHW5w/UdbqPt
	xNwzGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjbcgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 10:52:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae0d40a47so508466275ad.2
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 02:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772016742; x=1772621542; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OAUAXtj0TpegUipm2O3M8vHQ88s1bcphnoolZD2pbd4=;
        b=ghY17cljzHxbk/dd9qeg4Gw8rbDZEWqtO8HPnJDA2m1/6g0o/g4Kq8xLBs/WdDkbUV
         UGV26zM2gvyA/GPtsAAutZQXEcyyDGEAc8NvXklYvpnT6oABt4Hj8rjwRRj7Z9qRTy3F
         18Mp8Io7/bMBpuEt7nWtsL79rJkWFBSvNraOIU/uaEgUWpMgQl/4bR7vEtMClJ8GImho
         bkaGghknVapWO5BYSQ4E2lI3qlUJs57qXJVU+Vt4twEbDaqhhDfSgHyY6NJt+uxPiB6q
         mrBGr1UXCsXMDHQnlFhbbaKnl8WL4tO+OCQ2vW8GgMJuOgwq9FkbGkxCWBjfG32sdMHY
         ZNPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016742; x=1772621542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OAUAXtj0TpegUipm2O3M8vHQ88s1bcphnoolZD2pbd4=;
        b=D2tYVl19nOyDkIlmyS5MH5Owd5oN+y7Zpm2UjHKkvkezdVwQmjCbd4Hx80mXC1gBNQ
         NM+QdavxlLIEq83l+Q9IV7Nvmql+nvwyI28KsS04P29RBhmRZLsABRGZjTumobHMxPvo
         TSL5/t9rm6H8qnPlqBzJi/pj9TJ4AusR+PzrGNoClQvmkOrd14oFnNJJsKwB1OX5uMY9
         0VySYO5XRKeTm0K+9qQm5x0sJDd2929849+99AwgD5aqWAvvdaNvbu5LAcBVX8udcHGH
         wvhGb+vi6nBzbI9KQMZHAf53fHOZI6t9M/ypguXnQMvEuV9iJk3CDEo4xHGQUFYQcFeV
         rvsg==
X-Forwarded-Encrypted: i=1; AJvYcCX6i+0D6H+EAByQ4I51rX4r1t8hi+x9RvvgNS2dPnaPpqPbE57KLKy46gQp2gDOjjM2CwSr3EA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0GAtBszrvWqiQMw3gQ8p5DacHeDKlp2zkKBXHKBtaSz3HLDgt
	jRxB2W0E3o6XHEYJ2BzkZ6a1gqhzOMDvKpeqSzr+5XPGLsGRYHklF1SVrZFi2Xbo3WIEwkRpjl2
	EifnKLeZw/4DshT/4QYIHoA5ozOhiLjIcHw5V3DIF4NGpQSpjd8eAAWpMOSNBzb3JDY4jsnFp
X-Gm-Gg: ATEYQzzeftawdp9fzSVmzaZs9LIc+Cq4v21QuB2UNjJquTebsliVwDbpacQ3XmVZR6k
	bGPldG+STr60YNCB+fEmUv1MTTdZPn8XPvg14Z7EqwZIOMBj0CnYCqiYBnzJm15qFjPb3/3plsV
	G+D4CKXimeqiqu8IqlGAJh2WiLYoamHv5FnvJZ21tOT45CZB7OxDw39ESW2sBdAbFGpgXFhoaMO
	jZdUoIUYWCYPzFHgAB2C8QI0uvW6vzVr368ai4y99/wqsBfpFESK+OeEq6OFfqE9ZSfTH4pFmsP
	PmFNmLjuGVgF5+7fJibc709Bhg0AFx3dN+BFw3ZRhuWl+LqVbUnKQNNJtku4uGc2JC0llKh2ldd
	5/Ww3s3ezyi4fjvzEo0QqUfusnLC2CxXiv80eQvYdbkYX+EBg+rHDX3i+Yk4NtrQpcpw=
X-Received: by 2002:a17:903:228b:b0:2ad:da86:f6a6 with SMTP id d9443c01a7336-2adda86f8e2mr13518815ad.49.1772016742465;
        Wed, 25 Feb 2026 02:52:22 -0800 (PST)
X-Received: by 2002:a17:903:228b:b0:2ad:da86:f6a6 with SMTP id d9443c01a7336-2adda86f8e2mr13518555ad.49.1772016742005;
        Wed, 25 Feb 2026 02:52:22 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad75027affsm129081895ad.66.2026.02.25.02.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 02:52:04 -0800 (PST)
Message-ID: <cd7f80d1-7331-49a5-9c85-709d1c479a4b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 16:22:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4] wifi: ath12k: add basic hwmon temperature
 reporting
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699ed467 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=5bxsAFsTsoJVshfinvMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3kGRJCFFJ5bYJVDX-V_aCVx9aZCK1rrW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEwNiBTYWx0ZWRfX3t2PvOpMDQIc
 NOkFVqz3MBnq9OSXs2WKd2ci0Gbxl0Zr4h7lutKlwQB2ONhKf3+geU4ScZALXFytTnzNR6aKr+b
 cdq0mFJjqTajqfPc2kesevz3SPg4z/3RTDTkTAkJVDZzlW7GA38nVmSK6Q80/8NPY4olYx/JqJN
 LVwc4OYP2kVHsJ8YqENBzd9sXzNZK5LFutaetSsCv0CrpNRVi68DIc5T0djF0tFZoQ1BayMg8qd
 qK/OxjLQLJmni1n6fMGRFHVK7RkxkjowuzdEm02GxuMYWqjwQgL+glQuz2l67GlfS8+pzvy3Hmx
 K6o7zx0tPias5h5wBTZomv8Ci7U4FLp8+B9FJ5rbAzbD8IHYyj3Uf3mE1TeNPVaHaaZFZ/3fXjN
 vL2CQx+c+hFPAa/IF8uaKKdSTbOtrnu3NBd7xt7u8dZrjmijQA01wSgBkt/ePPFsORX0c/heNtV
 IQewSAG3Y7SeSNQ1myQ==
X-Proofpoint-GUID: 3kGRJCFFJ5bYJVDX-V_aCVx9aZCK1rrW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_025225_243987_0F05D1A5 
X-CRM114-Status: GOOD (  10.80  )
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



On 2/23/2026 6:56 PM, Maharaja Kennadyrajan wrote:
> Add initial thermal support by wiring up a per-radio (pdev) hwmon temperature
> sensor backed by the existing WMI pdev temperature command and event.
> When userspace reads the sysfs file temp1_input, the driver sends
> WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and waits
> for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
> (tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.
> 
> Export the reported value in millidegrees Celsius as required by hwmon.
> The temperature reported is per-radio (pdev). In a multi-radio wiphy under a
> single phy, a separate hwmon device is created for each radio.
> 
> Sample command and output:
> $ cat /sys/devices/pci0000:00/.../ieee80211/phyX/hwmonY/temp1_input
> $ 50000
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/
> Co-developed-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
> Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

