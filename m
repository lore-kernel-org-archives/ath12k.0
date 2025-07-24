Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F831C87FD5
	for <ath12k@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUfuLEoIdnAariUu5FlxMQ5ppIVG+Q99o1Gqqtl6aus=; b=lINMa8wLp3v9+TCMr1vXaSMNiR
	GHQqdHPHvwYYp4pYK5onrCkMQ3kmtUNaunZcGRdSv0E26Au2ysWkWBXCVqDLHT4Te9enXyMm3YSkr
	4WnDkMKhmOOdUVaega2Di9P0ub+xHK+flQ+5qT2HiojxE4jRJdK05yMucljmfLMe06O2Sk4c7EaQJ
	KjWx3optcxE9Rk7uhr0QBGYMcw8jVgwUvn9ITlXtQN7ZIOAyp1oQUbeI9oMqtwXYWZwnv8P9IFwKC
	3jccguLcxywtujVjMKhmUGVQNc+SCPWqTX9Gi0AsHawKSm92/LbgVo6lkJ6fO3Ar9DvWd+MPT2Gho
	7gsWkiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNq-000000083Qu-340M;
	Thu, 24 Jul 2025 17:05:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexH7-00000007miz-0T7y
	for ath12k@lists.infradead.org;
	Thu, 24 Jul 2025 14:50:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O6dFfi026100
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YUfuLEoIdnAariUu5FlxMQ5ppIVG+Q99o1Gqqtl6aus=; b=iIxBNV7TTRgMZYbz
	ll0LyL3FrTsl7y+RZxoH/nsd+LxeCofhyiMv6wYQ3vOeX81QTOk7JFd2avPhFlWI
	mECZ+xdhL7Y/ubeLdnCFzimKjveI145gPOUXYjVBzBnEe9bZTB/chZ6I6BASA0cL
	N3YcYz73aeDx3EFYFkBTppXsDgWHiBtkHNQZDZSUSEZ62CsDq2t/LN0ssm9+odpa
	JQ6OljuNj3BasXQ4n9cf2bzjU8iT7XxMQkkYtUmW/phj0WNwKbvNLgAhdNjSyKqy
	8q4T97p+nXzWCeZpF2W8WI+x4IH15khbBpkgGHhRJUuytwCckqOlTWqYylwVziLH
	9GOxGw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483frk1f19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 14:50:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso1528210a12.1
        for <ath12k@lists.infradead.org>; Thu, 24 Jul 2025 07:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753368623; x=1753973423;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YUfuLEoIdnAariUu5FlxMQ5ppIVG+Q99o1Gqqtl6aus=;
        b=hn1uprP3tUrSljWJOUIEZ4TwrL7bZ2/wtr6LJgIHlasT0PmG1kX6plXryRiEIQN0PQ
         O5Rnj+Eglz9SgYbuqh8CG8AUEGNong4P0brMrypMAvAQ/dkz1MZrPr+0QSFVdSRs5+fW
         HDpokWoXUSWCZWRXel0TB2mPl2llQB+MVEHcvfK7xUqgYLoTreT4wUC8sY377/H+9/oh
         TqpRFqcxQkcXSW8t5mcA28Tz3p5X/x6OobzcUu1Lg6aELnXWkDGCWGfSKGT+c7OVin9X
         HeVXFeoyoIoaVr9Up0IQ/dXC8CIHeDFgqeD/gZ7DGkYuc2VPqq65nKmmZZvbkuebOt1q
         TAWA==
X-Forwarded-Encrypted: i=1; AJvYcCVOoTnukZrgk+87RAqiQZc2rNuCgMyQGSUCjl5xvZGKvJW2QTaab2FvTj/B8RVpaYTTLj0+qPk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/egwPiUVLg+0plYOf/U76B+avEsi+uS10tBg2Zq+hLf4sNZjy
	Ol0SGtmvJ0KMdbfh87wpig24BtIj1azGUW8jJH3Sgv2U92ikfQQDd4setgKm0oIuJ3458wrb2Ej
	Lx7aKFcGckctKC87d1H2LkxI4JQ3zr8b+MW4fuRgCgN9Orkhpe6iqBQiT7Sz/yEdF
X-Gm-Gg: ASbGncs4jiQLaTaCq7fk/NKteeLnscGrsqC7o8JHpC1x9KAWyGarLBqSjDWVB+Mir6h
	IU/vRXRP/6gLGhHWUb02LPNTjbXiYd/LRzM7HnU8MWAz8Bmwnyy/6v0DT7HKQPMmoxiMWbPoeCK
	X6ILRIsJhB8YC7G4Q8bkY4M5xoNJqH/0ZzulInM5/UN51bvxYm3WFxG7RwIfh0EtqiptgrSKKwf
	LkMLUeKiUyfFnMGF5j/xaeSNCX9zEHxyPBKkWoIcF8K7uYKJQjrthbjqgqcCr3yzbMMTcFqypeu
	J4V04qVqQ7NB7UrbLZDGgynOOyVaEu1bsy8U69NHHseIW/0Fe246+cV14YJh+skdSa/xJPtKE3h
	nOJBHfmD3SgsP
X-Received: by 2002:a05:6a21:a344:b0:237:b2ff:d1e9 with SMTP id adf61e73a8af0-23d48fe385bmr10442618637.5.1753368623385;
        Thu, 24 Jul 2025 07:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIx9fxxFZ30mC0lr5rlZjBmEUhtphZzqcrttRBZnGvl0JMReiDlPTpW0EzyJwjRUmfnr4q5g==
X-Received: by 2002:a05:6a21:a344:b0:237:b2ff:d1e9 with SMTP id adf61e73a8af0-23d48fe385bmr10442586637.5.1753368623011;
        Thu, 24 Jul 2025 07:50:23 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.197.167])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f6c0807aasm1611486a12.11.2025.07.24.07.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 07:50:22 -0700 (PDT)
Message-ID: <bb79687c-fa7b-4a7b-80e6-abace493cfe2@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 20:20:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix peer lookup in
 ath12k_dp_mon_rx_deliver_msdu()
Content-Language: en-US
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Chandrakanthan <quic_haric@quicinc.com>
References: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250724040552.1170642-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDExMiBTYWx0ZWRfX/g3q1VnDBVBx
 oCL7rDDHWynhc1v+Hc6zuNs6KNLIRGZq+Kfq3hDKMooBG/+wqaFCRmy2F2C7EoV8pXPm/E8p5ka
 mULW9atb6NKlzHZRAAo7hLGRQsKk8KOnRp7lEL/mThrRxJ6v5YJIbvhRJKAwshPdI9HvlI35z6M
 AhHctt63WepWnd9i2Lt6vR9M//JTr6GlYWNkcaBNyVzsdYiwrUN7xEd39mQtNLgP8netBkfyFBR
 bnNM/C6RRzKlAJJtjvcQ/NVqb7R2vVDX2IQb1ntiWu4b9USe9k+dt/MCPkhEE1z5KJ3KlDwy1Tb
 AKxgVS79passLn22bEZvWEsSrFObpDb39tG8R+YQ6jvVMhRwcIpdpLg6Vj17yv0YW0dij79zC8F
 T4fVvsAqr5qwbxeWdyhXkrwbAUgPaWilMzOno8CXmBYCAdY9pQ91pbWeEIUdLR495W12c9fE
X-Proofpoint-GUID: H4ZyGm9P8MbvPzZ8c6UmpTUsJOFU-tHC
X-Authority-Analysis: v=2.4 cv=WbsMa1hX c=1 sm=1 tr=0 ts=68824830 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=CkStrBlBBtcNoDngQR/Gdw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=BhMcNSPQYusP4RIe-kMA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: H4ZyGm9P8MbvPzZ8c6UmpTUsJOFU-tHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=786 bulkscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_075025_167170_4A5F5991 
X-CRM114-Status: GOOD (  13.62  )
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



On 7/24/2025 9:35 AM, Aishwarya R wrote:
> From: Hari Chandrakanthan <quic_haric@quicinc.com>
> 
> In ath12k_dp_mon_rx_deliver_msdu(), peer lookup fails because
> rxcb->peer_id is not updated with a valid value. This is expected
> in monitor mode, where RX frames bypass the regular RX
> descriptor path that typically sets rxcb->peer_id.
> As a result, the peer is NULL, and link_id and link_valid fields
> in the RX status are not populated. This leads to a WARN_ON in
> mac80211 when it receives data frame from an associated station
> with invalid link_id.
> 
> Fix this potential issue by using ppduinfo->peer_id, which holds
> the correct peer id for the received frame. This ensures that the
> peer is correctly found and the associated link metadata is updated
> accordingly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: bd00cc7e8a4c ("wifi: ath12k: replace the usage of rx desc with rx_info")
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

