Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B17C61DFD
	for <ath12k@archiver.kernel.org>; Mon, 31 Aug 2026 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=; b=j4ucBlvyMpBTSkKLbk8z79bAcW
	nNo9zBbhMFHnU3FzM385mpZHWZQmYNR8scI13+4uzGrVFKYb4EHL1ECVXh24zrDs2mjY/TqzhZquo
	80lvunEUORMyRpckNBBSa6rWezEbjjxczjPuJZr5wotUaeAfpE7nNg2Se57Zuv4NqkJS66eaEItTV
	4XQGcpF4GJGR6ZLvBcKSzlzhVJl6W2NQ+YqYuHKUAL8F+i+FG9DEjXPVBvX2/FOIFIItSjqE3vXB8
	ZJNl1SwhxmgenAURR6XGIuDatM6ZBQ7oZhXlGUkcrdHMtKpmsyPr0LdsFLhmgSRDZtpSKlgkI7hoy
	4hALG/1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17sY-0000000AOTJ-09yZ;
	Mon, 31 Aug 2026 19:41:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x17sU-0000000AOSw-3Y3E
	for ath12k@lists.infradead.org;
	Mon, 31 Aug 2026 19:41:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIYHBs257973
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 19:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=; b=hTCHifCkykOx3BUv
	Dk8viKoBBKc75sKUj01VBObMyqFUU65gRpe2AvmwkdsicPmjbaaZslhLZt+owvyE
	rQttCHCtCr3ZoyHco0lybdDMV4Zg8tnWvA20Bj1a2NKqhEP9SffFwXPUYgl02A/d
	wzzz6eUpHDkHknCT2f39KPK/EduolDGiqx4PCpr62fRwrB2OWs0GDSIAFC1MDvWy
	nGbcTIYGMiHlBMxizFcBZFsNSwaY8PaNVpaWVJm5UwdsSFq8H/5FyyIYHptVYCzK
	dRHOo7NlQF2CA0QJaHoY2WzEO2RmEmBYg7IMnZj/8WrWqOVjKtz4QJFZ36a1Kutw
	/zljwg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rbatwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 19:41:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so6489269a12.0
        for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788205269; x=1788810069; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=HFQh3tsAcxqUVuWCty4N5sCLQ9pzgs9iaIBSjHtTdIXHcgWAP43Zf23M2+qG0Ys433
         Gd1gEqqljutTAyNci/DuOIBnobWd7jfntBbZrDMVW+S0s1lmK3o7oHAGRmvgyvtP6z/y
         l9C46SL/cftrbtMOLqMSOtFmSbTr8XdyEMfznHG9p+jyKddL2aM7FigVvqkTizIlJz38
         hwRstxnDgnfBilYdTU6lw2+ZFUkUGEhFeH7WyOSiBdCOWy3PP2cST+Bo6+GZFqsMH6U7
         Mq6Yq1bsWcbESTFZD0Zwlp0l3+/mwCVxvWBj6tyyWGCmNBAn/ZcJVGm9cgYcJTuwKUyS
         WDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788205269; x=1788810069;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/VOoKcp2TQjssQcleMKDkNpgoRKV2OUeoT4RilSG/8=;
        b=Dla8uo84biBx8Uy29CpMeXL+quiTjahKLPbZKhx8IHNvwWRCMrVeAg/pG5/XflGFEQ
         Mmb3JfqibOxCyEaSuKh1cXL1/OCqam1LC+V/ofAT1DD+M4avBxRNezBBzIt6f3GWxW3Z
         MbU4axAMEReR2FowOQyxr/WiNV4ZXNJZKV/BpltTYJUXf/5k61haR4uJplkcwSF0+KH2
         VmnGQZIPFBeB6vHrFNac3AfyzOntrsH1yoThK6vgyUORP9UGqE9UDks4ahQjRHjJUbxZ
         vZ5atVnH6y4SM5LG3WWjoRrId2jXjozbyE4NqDPGu8gm64JIgT0wxniUqeEj0yc0B4cO
         //sw==
X-Forwarded-Encrypted: i=1; AHgh+RozOQZXsUDPHOugYg/MDGGTHR+bshf082F+Qqr2aqKD6Pvx95Jh5capmouZQLqHHwzZuTZQqAg=@lists.infradead.org
X-Gm-Message-State: AFuF++kLTygPJx33KhZUzIFzswICnN37ZfeAk++Ikem0+gZHG3ydoMza
	NmFeAsi7WgwoaZUf/qzxS/QMv2LcYGYkh/N/CbJ/WyXl4gZR7ny2egkbAirz5DnIRGdaA2W2yPH
	IjaZcHn2L09DjMcxK32GmM69nQItKC0NhyV4DGh4V4ZD41Y3YtgUkKdX8GcUJgBd3
X-Gm-Gg: AR+sD13jv+fzndjjHcRtNtB6nKF0pMW5+wDj3Wb4GF31vjyOQmJ4+E0oXMyeaU8o2WO
	KiBH2QG0ZRo2Iroqest0kDiwQpJaTAE2dplpuLFXajFOboYslkEOe5bxkho2iS/quH1Pt/McwOC
	anSZErdIHDPZc3cYAF/LTJ4lUTE0boFTgeDkxQgTzoapwZybu9aiuThA2z1OXvz+RPV58C9s6Y/
	xwEYAVJexWdxpGEOfXSe9hFeY1DmpCDwNfKLwADL6EudcfR+02ES/U5iNjUIBFaaAiCCqe8aYxD
	+/76GlkCXrYPCspCwTsZV+dN2K4zPHFnC2LMGqhxeC5PvFTeol1dJwfJiW0xY+STrKilkyYIbzj
	v7NS1vzNY18NRJg+5XUawE8VAqRdSCB2sQe0L9MQCNY6x80VBPZ805X8=
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311303637.21.1788205269009;
        Mon, 31 Aug 2026 12:41:09 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b05:b0:3d3:aec2:4dc9 with SMTP id adf61e73a8af0-3d7b054a699mr5311251637.21.1788205268534;
        Mon, 31 Aug 2026 12:41:08 -0700 (PDT)
Received: from [192.168.1.20] (163.sub-97-215-3.myvzw.com. [97.215.3.163])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f552473sm35477313eec.0.2026.08.31.12.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 12:41:07 -0700 (PDT)
Message-ID: <dacc398e-04e0-4b30-a770-9308ad4e80bf@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 12:41:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8024a15f-bbab-47ba-bd18-f85eb1fe3dcd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q2-br01IvPJErzCenNhY0WjyHf6c4XD9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE3MCBTYWx0ZWRfX6QzBbYYMHLzx
 DuSXRRf7SK0T/JugSqiPyg0IvwwH9iqo/KLuUxTR+De0LT+ZERmCKyPqqGZLjETYWufs2v+SxWZ
 a7/3YxsXIf44MPESJV6BiBYIESMyFrFyd/LQno4pCIaZnlpV2bcWFh49l76xKMAojxTf2SstoDW
 tIPB6yPYACqxfVOUr0ufOGKJIZAVcegB1mHUCmWGHWR8XKclKaB7figj+0fkaiQ+bNOkacf0EX9
 brmo7GE6fgxiwlqwZozqncS2B1bnyhn8+uB0ugKKiyR9i4N0n22oBnCB68IbhpT588fg0ygiNrc
 w1hXgydONd0CdmSMyIlGQZsVb56JAWiVYy76xASr92aIFvbjUse3GdGsNea3qc3zD6XJOn07C3B
 Q7hBqQ5Xwy6Bykia0aE4eNcjvrpIDQ6Mnf7uAt33Im5R6YOlPS5Pc3g+vFkHdrhdHc6ZWZ/k/1T
 7Leb2PZw0kfjLVw6GOg==
X-Proofpoint-GUID: Q2-br01IvPJErzCenNhY0WjyHf6c4XD9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE3MCBTYWx0ZWRfX9c7rofZKdlHh
 B52ALhh5MGuhmxK+mj9mpz3jUSHuxrXeHE1PiHQqDTM+YtX0xdkSpVVLYH83yg8UICtf5klCu0Q
 3micKGd16DK7R7FgEjjZDkVrWxybNg4=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a95d8d5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=7QqFuFOOHQR3GLhHC5mhXA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=hMWfrMBfY0pDR5NQx0oA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_124110_900356_A36D5C65 
X-CRM114-Status: GOOD (  15.62  )
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

On 7/2/2026 2:32 AM, Baochen Qiang wrote:
> On 6/30/2026 9:30 PM, Andrew LaMarche wrote:
>> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
>> index fd762b5d7bb5..3cf39ae06fd3 100644
>> --- a/drivers/net/wireless/ath/ath12k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
>> @@ -2945,6 +2945,10 @@ int ath12k_qmi_request_target_cap(struct ath12k_base *ab)
>>  	if (r)
>>  		ath12k_dbg(ab, ATH12K_DBG_QMI, "SMBIOS bdf variant name not set.\n");
>>  
>> +	r = ath12k_core_check_dt(ab);
> 
> I understand there are already some variant exacting helper (ACPI, SMBIOS) being called
> here, but they really should not. After all, how could a qmi message relates to ACPI or
> SMBIOS?
> 
> I'd like firstly move the existing helpers out and then add the new DT helper.

This code is exactly following the pattern from ath11k. So I'd like to have
this land, and then we can think about how we can clean this up, especially
since folks are waiting for this.

> 
>> +	if (r)> +		ath12k_dbg(ab, ATH12K_DBG_QMI, "DT bdf variant name not set.\n");
>> +
>>  	r = ath12k_acpi_start(ab);
>>  	if (r)
>>  		/* ACPI is optional so continue in case of an error */
> 

/jeff

