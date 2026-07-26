Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB037C531F9
	for <ath12k@archiver.kernel.org>; Sun, 26 Jul 2026 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvwEmSyQIGww0XlGQdHEkIz81uCW1CTDp942jJRkrxI=; b=HWQtwlfCmmCId6dqC8I37C+st2
	4IQDWbGw5pPfrJTTgNp9aFUioGk1lIhXvHkBfjS/GdKzBt5uNIuStRXpmzKyCcy6K9DfeFsOTLRUJ
	S5FVc1WanBzTbeUcPmPHSqj7Wm9bFi3BmdoK3etMRK7p2R0PwNLy4uHIjcPfKyv9FLeYPdwGusYVU
	c0l8exEbi9IKE/xf/XIBzur820FFXriN5lO+IqpVzJ7a9M7XxwyVzP0svOV6oNpkDVx425JXyK+ds
	bKCul5MMdQvHx6CwcfDSqFCzQqcWlmbfR+G4JbrGVPCt2y50uakPxPHWnZtsfQbBAFJbBQ9dRWaTJ
	IqV4jzOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Rw-00000001LiA-2kTj;
	Sun, 26 Jul 2026 16:11:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo1Ru-00000001Lhc-1UVW
	for ath12k@lists.infradead.org;
	Sun, 26 Jul 2026 16:11:35 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2l5o1973648
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 16:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hvwEmSyQIGww0XlGQdHEkIz81uCW1CTDp942jJRkrxI=; b=UNWGoT1tZPlHPpbE
	E4SjtJdQBE7fAKzsFWBFTnULAcqLAbcDe7TUhxMQZ2zjiHMl71dN/2xDB/ad0WpV
	8zp/622Mg32amV83Vgx2t9jOv/f7cuxGS41rv21SJ35xRSXwzuV4YS/H5pxvfjCv
	fvYPAXjrMEvj2HEcxn1grIK72URhwv+rTCQ91fkKwqGuAMEWfVVm45XerrQdWVTH
	PQy19fAzGsJs84sFizYDUe6PzjltyUkdLL1OtkWBVFq1gbmi2SLltiF9Yx+VdcX0
	Lk8gR216sHpFQoQsU6WTBjniw9oAeDw5fR0izX4lYRQN70MPqUScu7do9R5l3Vl6
	8SHKVg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufugm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 16:11:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cae455cf6dso31480655ad.2
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785082293; x=1785687093; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvwEmSyQIGww0XlGQdHEkIz81uCW1CTDp942jJRkrxI=;
        b=Dn+iCV5Enk6K3paPV0g78UX0nO83q7ACwhC1N2DON/CMaovPVlro7kd+ZqUwdrsgP8
         RIko3me3BfcViM7aqse2gFxh62yNhf5m5bf4u8hWCbJHKGHNxD3bPvQA2tY6EbyuGy8Z
         e7smiNkHT9LJugs6U8Plpw2GZcEEwden9YEwIs5MC1MWBJThezmBmWP/Rr1sWs7OC3wW
         8WPFK4w2ioWtBUHcXwESX/SE9xxyGsdLNDhg+qLqDRH9bJ58fpyYcxuHgZcooQlHlO6g
         7DWKdlq9YojQqdVqDbysZqmG87n2xJQLpDrPNtFt8dCjQzUqCn055toTRzmtaxy3ydM/
         s2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785082293; x=1785687093;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvwEmSyQIGww0XlGQdHEkIz81uCW1CTDp942jJRkrxI=;
        b=IQN54wathAmAmI2b8pv6kO5bRKdBe0JrvcvEMaNtSRduECJ8u08lfvTUc6IR4gnfV+
         wgVlxcguHZMrCrhjis+vuvO1svnxumzNgem2iQkUwp/6JZyj7ErC4VKg/Ql+gOgqTcW9
         LahiLEN8vFMiFMpYkPvO8ZEoNVsVfDHOOr3Yr7Rnyb6/6DwbyeMTZX1UTdW3PLH1qfUA
         5jHyV36IPo9ikpmStc/wyzwvAxLkgKEk/iYZYyqbKoAHu78p4VpKJb+hOIh8Q5a9FHlU
         zCbR2SeQiF3r4XevD2J1bjWS7qbl0wSIzPWd+VqjZ6oKm3tDmtXIPrWQa9u4YmymiTtj
         NyAw==
X-Forwarded-Encrypted: i=1; AHgh+RqsC5/5J1lKYdvJvdRMtZrtVPyXvW0+d1OA7apapJzz2OQGdDvV6mZ+IwBuchJ5+dI2/jWN0WA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbI2gHWctAWwJKkc53YppIAI+5CNvSVFRzr/llkxBP/F7013Tt
	MU6Wn+6ZRXoICSX9OEYJZ7dTtp5YeWFLiMJ/u9F6onobB6IIiyODFJ+uTKB2svvwFX6ywSmlVBZ
	C+nrVY9Phq0/G7r4N4VfQxOq0vjnQlHp/wpWPgJwdARxBlzjPoRKz3MIEy7qimEkh
X-Gm-Gg: AR+sD10m99DQP/WDtE1X5LT3tQQeDOdDvoTwJrXye9Ywu4u2OamgR0SHoYo5FvsToVJ
	/JMTFGILQKTFogzHwNG0+qXbu5ALRMQL/KkfBvzc9EkP5sUGyGHJUl7bwtdRBlbPT4mWklx/Ol4
	oYhcaARdllO4TW+Cgox163EPbOYI68f+rAm/sUmGu/esDHBPtSqYXcAuNrPuaIDbkADsMeapwl/
	matnBsvBQ5eSZHqBskOgDrOVIZQQNoYg3sBeMtB2mnZwoAKLiqBIGGLPrc5v9lOQ3aYj6mU6ZPd
	lcKeP4FjKTIOA1oYN6yq4XXtVyMSLJoWa+9TlkdcsbHQf2VwUqD82ce7OFXseO0H0etkMc8AqNB
	+5lHN4hgMTExu15aztmj20IRfTxRDiWQt0ZfxqJCfOUbUs464YSoToWDQww==
X-Received: by 2002:a17:903:19ee:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cfde866afcmr49500935ad.24.1785082293002;
        Sun, 26 Jul 2026 09:11:33 -0700 (PDT)
X-Received: by 2002:a17:903:19ee:b0:2c8:2808:3ec4 with SMTP id d9443c01a7336-2cfde866afcmr49500715ad.24.1785082292605;
        Sun, 26 Jul 2026 09:11:32 -0700 (PDT)
Received: from [192.168.1.11] (15.sub-75-218-246.myvzw.com. [75.218.246.15])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm36386221eec.2.2026.07.26.09.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 09:11:32 -0700 (PDT)
Message-ID: <c455a465-254c-48e6-9183-7b67d4b76dc1@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 09:11:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 6/8] wifi: ath12k: track per-ring RX
 sent-to-stack count
To: Pardeep Kaur <pardeep.kaur@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hariharan Ramanathan <hariharan.ramanathan@oss.qualcomm.com>
References: <20260723125448.922361-1-pardeep.kaur@oss.qualcomm.com>
 <20260723125448.922361-7-pardeep.kaur@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723125448.922361-7-pardeep.kaur@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kSfvWxCde0ok7NUjAxn4x0ZP_V9qUlrN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2NCBTYWx0ZWRfX3vV0MngtUGiS
 QkQ7VV6y6e8S68GHraMs7ypAoIaNmz/Q8DJJ/w8ZVCJNhnTZwHdeK/2kt8H3x26YM21eWsp2WJN
 GPX8GKHhf7CNAtfupeI2OwCiBdXJSR4=
X-Proofpoint-GUID: kSfvWxCde0ok7NUjAxn4x0ZP_V9qUlrN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2NCBTYWx0ZWRfX2KA2deRbfV2M
 jWmNI3bZc/CGm3LRvn0O2npoSbaWywIgFSBp6BdBfhLyhVmxW3lWmDFbNHPlh7Hbqdqt4epBnBb
 ANEk5HQilsyIgLwHuhZT4P6i72DYcWRA4orocjWw5zhk2r6Annnj4yZArjRyb+InMO/ZP8AOwUA
 SiNpGfOn/VbDp1MT80IHpu9GkJaLoQq8luSgoHAv8ae+vrbJgNrrhTuHEOQyF1BiSBfBjQHVuTr
 yubOqXwQy43Ps7hvAyuDwVn11mfFBZlh56LVp00D5da3NWvZ6NG9biPQEecH0d9Sm2Ifx/Eaolo
 f/LFMz9/877Ll8A2YOnJMfqgaPGApFm/k3smgLNvtLECGpq8YvSdSyJAPG10JkLJbUy7ZDxHSLj
 hDm6M5eb1qztY7xjHigYQchl+AjK/CPizAc9b1Cu98ZDesSnt9AC/oeqOnfHTjmKIX6+AlAQFCG
 Sy3faARGiVkbJB0DXOg==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a6631b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=6VQYfvmiyQ8t40WkS/mQdw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=RnYZJU0MdKe6MKTUfF0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_091134_401874_F037E403 
X-CRM114-Status: GOOD (  12.02  )
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

On 7/23/2026 5:54 AM, Pardeep Kaur wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> index b203513d63cc..33c4c89eefb5 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c
> @@ -651,7 +651,10 @@ ath12k_wifi7_dp_rx_process_received_packets(struct ath12k_dp *dp,
>  			dev_kfree_skb_any(msdu);
>  			continue;
>  		}
> -
> +		if (likely(ring_id < DP_REO_DST_RING_MAX))
> +			partner_dp->device_stats.sent_to_stack[ring_id]++;

My review agent had the following finding which I did not try to validate:

sent_to_stack[] is incremented on partner_dp but reo_rx[] is on dp — this
splits correlated stats across two devices' debugfs files in MLO

In a 2-device MLO group, ath12k_wifi7_dp_rx_process_received_packets()
increments partner_dp->device_stats.sent_to_stack[ring_id] (the msdu's
originating device), while ath12k_wifi7_dp_rx_process() increments
dp->device_stats.reo_rx[ring_id][device_id] (the ring owner).

Reading /sys/kernel/debug/.../device0/device_dp_stats shows reo_rx[ring0]=N
but sent_to_stack[ring0]=0; device1's file shows the reverse. The two counters
meant to track the same traffic path cannot be compared from a single file.


> +		else
> +			WARN_ON_ONCE(1);
>  		ath12k_dp_rx_deliver_msdu(dp_pdev, napi, msdu, &rx_info);
>  	}
>  


