Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C283F9EDCA
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mC1j34T7H8QnV+yrQN6L/rJyl0oDqhmpMij72LcTN0Y=; b=kvSKGvmI+k8uRI1auvLjDW2zpe
	FLspyKRikj1T8b7pXpWCO0h4UYtgalf1yJ8X5/U95KZtuv1+lLyzfnxVyKtnTNsqgUEX9xCmKgDeS
	DUPkDKvGvciyQX2C5+woYbIZigng3lVF2cBUCmFUhmlBuHtbHbn4INSjxN+swDj00FaOuKnonx4dd
	OTMclExVNI9HZiKq2VMwDwgniyJ0k3mPlONSD2fjHtIyrSf4NQbhSAh7yg3lH7Bn5iUQqH+9lKP5x
	v3XqT4hqEvTBU1LdBQ57GSAvWVEK7/JN6OFAqiFw9d5jiQ3uAqJQge3Kz4hDB8rrFm/2g8eJksHpS
	REdk+htw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXHj-0000000AGAr-0g46;
	Wed, 22 Apr 2026 13:06:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXHd-0000000AGAN-0hSU
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 13:06:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAlSrT2209080
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 13:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mC1j34T7H8QnV+yrQN6L/rJyl0oDqhmpMij72LcTN0Y=; b=msGHaOm7bN+xIxnL
	NBsQjZmlXu/BWDCh+Jji3z8FcbvgwJxrfYrq8G0CI3mJaFiKkB4qhuKaTbcQGLDp
	xqP0LwOfQS/eDQyBsDQUsMTu2786vQQsgCiECDMHV/a7AykCWXhDUpXF7I+qx2IK
	Hvg8WQ+XKOzh6HoY+YxmyJmxLB2v5hdH1vbga668JJ37Nu1odlUsxAlfrPla3HBj
	JFJvrJIryxt99PRSsd+iQGtPO/3/LOJks0X/5VtL4FhJDH/vaCy8gZ1ZZCWcxUtx
	rN2OG+yzjLBCXspw8WHigd8iX00rSgNSjC99xE/MFI7TiGxp4q/Izc1oX6v0Vj2E
	ybU/5w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpengbeq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 13:06:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa6c3a77cso2799426b3a.3
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776863183; x=1777467983; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mC1j34T7H8QnV+yrQN6L/rJyl0oDqhmpMij72LcTN0Y=;
        b=a7RS/c5LEY0imYRMs0wRX/FCUKrrZXQznay8JrnCuDZAwnSUTYkf0hMyDV/eg/oHJC
         JWM4bpUbus4qxpJyZ22w2nIedC+CTswhWg5RYRZ7EU+Yr0fF70qPpirdK05bwe6CA+SV
         H4UsPhTgcPi5K/k0lcMNRddqcguVvbq+QKHd2AprHpFz2O4HGkBv3Hq+BpgYd9MW0tBo
         uPrS7MJbFy93rafCtAOZ6Wo3E3Hwyo2Uw7BoUKluzyOK8wW4d0pcSPquH8deeUSKRMwO
         yruckFPo+4x7hqgEj/pxIcXAHr6tMbEi9fsYd/qvcPJpFVVEfcCYko5ZdD914pI/7nuQ
         Cfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863183; x=1777467983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mC1j34T7H8QnV+yrQN6L/rJyl0oDqhmpMij72LcTN0Y=;
        b=SniF6Sur784M80I0ej03GUXpWbB+btbFGuYauXLg/DgJkrCmfH48pBzOh4c241tuHW
         o4+7JK8gPuo7Ika0JtBuCYiz8rbOxsrS5bhbsouWGN35L8deRYc/aDfR6Ku1u7gQZPll
         NVaBvci972IFREIt4wKi3JUG+0r0dWqWOK1Iq8GxOcuDOUn2QpFGJpcCqj3RwtWg/65X
         4EjwXoWCy4SNS+aBbPcjLVz+Qbcu7iryJZTA6R+lZIxLJmYVc51gAczNVOzrSWJ9ivC6
         dQnZcxKwDxB51HgHBNBXajsdsPpH3VAzEDUF/BWR1nTPbtVddLQWlOTxQ6BMeBCSoI6W
         X65A==
X-Forwarded-Encrypted: i=1; AFNElJ9ZA5WBCNLWf3TxCL6hdUGWMayWgFs01JcElb+iyFrKQsn4gSAwrRhcrsSOQJs6wOt0Gr5cCvk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlmCvD2HkO1IuXz+FWzFYDZcALsARlGhEO4JFaysJU3JK50m2r
	QNODb2e6pv/tBuEffvmf30pGg1jZGMDgBUmFtrNetR6seHd5n59xdpYgGUjlgFGebih2ouXZcyu
	/OtvAxzHpLCnxCLtJlLZGDuz3wfkksetkIOEgHOx9WgOBVz2belJWeweNPq2pNvH1
X-Gm-Gg: AeBDiesHX7ABwjLySYjHhsw+Fq/AdiYgbgHdc6+z6aJt8/paqakIRCgIlOxnz1W0Sn3
	1NeOmKfsd8OqTSGfeQrMfCLtijMO+v2UzqWDIv/9jrKz93vPTQ4n3qsPBvCn5HipF5EyLhoVe+i
	Dpcca+40rlwCHEaJ7I/f47d2tDnwS2J2Q+exni+E9DVn37MV1+Eoldz7jT9DEdmTJml1Aw5QGii
	1rUSqmXjY1HqeZF2eg5al5aCAYT+hG6DqI13UZ+22P2uKS/V3CfiKKCps8NmLEU3oCmVdwdXNro
	pfZHn7hK+LLL0GzM81CUVoqj2Zyz/vIz/4qNYD7zodNErAAaCdl0tqlFZXeUDBUCZEhjc2SdiRD
	8Svk5qgRnBTNznB9VwoWxIg1kbfGZFssi620jz68iPMZwfxYQoMD57qlzKsvMkorY+L0bgN7s7V
	ad
X-Received: by 2002:a05:6a00:2288:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82f8c3f2b00mr22912342b3a.0.1776863182972;
        Wed, 22 Apr 2026 06:06:22 -0700 (PDT)
X-Received: by 2002:a05:6a00:2288:b0:82c:e76b:c68c with SMTP id d2e1a72fcca58-82f8c3f2b00mr22912289b3a.0.1776863182301;
        Wed, 22 Apr 2026 06:06:22 -0700 (PDT)
Received: from [192.168.11.106] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb33fcsm16417095b3a.33.2026.04.22.06.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:06:21 -0700 (PDT)
Message-ID: <3e83cdf3-4aa4-44ba-a0d1-c54600552186@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 18:36:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath12k: thermal throttling and
 cooling device support
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEyNiBTYWx0ZWRfX9OnCQu9yUi61
 N/JYKuANSjvqx2FmaYozNgBkMAvVuxM/+ACr0RVeX3vDAdfS681El+oJ4DhtA3Ujsk+wxf+bNH1
 TFYC+rAoPbXS0pVA0Ia8USMnSHpen+M3TtgN4LudEl6ABc5/8C477Y9QT3dRMhdEz5xm10XSSCT
 /28blG4t2lHu8LZTIMR88qVTVozOxs3LY5VwPPlunWwkkALHcPxVmGeuf3adnM4TZWxcgx0RcMQ
 +FtCUTUd97HdNAiOv5sz9FgPuxAakns9Q6HJjUc2DxlESmzVMJHvFA3jbigmUjXZiNlb68Rko4l
 ayP/pfc6+ohsfSul57xx9DY3BqExpJMWLOtb7tYQdEBhZFn14qrSipxWBPRJ3wmWymC7xvddBqK
 aZzgsP/0yuLWhHZyB3x7DpUI69+f3V9C5RkNC3FBpTVBW4Qb74PTtd/Lu2H8vV+b4Kc2HNnzFU+
 CMkdw5OCfbYnYnT1L2Q==
X-Proofpoint-ORIG-GUID: 1422yQ8E48yjJuFOcw-3gmSlZRiIp6QP
X-Authority-Analysis: v=2.4 cv=RYygzVtv c=1 sm=1 tr=0 ts=69e8c7d0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=H-Wgj3y7uwXhWPCsC4wA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 1422yQ8E48yjJuFOcw-3gmSlZRiIp6QP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_060625_355408_C8F830FC 
X-CRM114-Status: GOOD (  14.49  )
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

On 4/13/2026 9:08 PM, Maharaja Kennadyrajan wrote:
> Patch 1 handles the firmware stats event so we can track the current
> temperature and throttle level per pdev without spamming logs.
> 
> Patch 2 enables thermal throttling at bring-up and programs default level
> tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
> IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
> levels as advertised, and only fills optional fields (pout reduction,
> tx chain mask) when the corresponding WMI service bits are present.
> 
> Patch 3 refactors per-radio thermal hwmon cleanup to reduce code duplication and
> ensure consistent cleanup across thermal register and unregister paths.
> 
> Patch 4 reorders the group teardown logic symmetric for safe thermal sysfs cleanup.
> 
> Patch 5 exposes a thermal cooling device per radio so the kernel thermal
> framework or userspace can set the TX duty-cycle off percentage; writes
> are validated against the throttling state range and host state is kept in
> sync with successful firmware updates.
> 
> Examples:
> echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_stat
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/cur_state
> cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device/max_state
> 
> v2: Addressed Jeff's comment by rebased on latest TOT with wmi tb - alloc and free
>      interface change.
> 
> Maharaja Kennadyrajan (5):
>    wifi: ath12k: handle thermal throttle stats WMI event
>    wifi: ath12k: configure firmware thermal throttling via WMI
>    wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
>    wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
>    wifi: ath12k: add thermal cooling device support
> 
>   drivers/net/wireless/ath/ath12k/core.c    |  50 +++--
>   drivers/net/wireless/ath/ath12k/mac.c     |   9 +
>   drivers/net/wireless/ath/ath12k/thermal.c | 252 ++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/thermal.h |  35 +++
>   drivers/net/wireless/ath/ath12k/wmi.c     | 108 ++++++++++
>   drivers/net/wireless/ath/ath12k/wmi.h     |  50 +++++
>   6 files changed, 447 insertions(+), 57 deletions(-)
> 
> 
> base-commit: 9a4f673eb08d2a7713b258d671b4a45f2a6e68b7

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

