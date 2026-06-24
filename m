Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A59CDE001
	for <ath12k@archiver.kernel.org>; Wed, 24 Jun 2026 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnKPMbaEz8S6AzH18qjrZcejfBYDxVuJNEStVWJFljo=; b=q3gEcfl6mJzglHWIxnvcwWRBuW
	+pzyqWRs6VHJkNftmKZycF9QuQTRYfBqRiNxqqztAMlt6HX8POzs2ZAsf5B7ZBCYuTe0F7uvSDjtf
	AoReMvATtz5WHe2Qpp0xjDTLKqQPFSrdrm+XOqzVgWIwBl6/n0KvF2WDZQ2xwiNx2oRfpED+zNwRn
	20BLJ+DHsWtT88NoJVD+9Rn3pzt8RhdWGbDeE6ecYHQjQqqdG6a9FCJpTCTVl4OfmL9gVDriUK3Xt
	lABHfT3sPu6kXXaWBqWAfBrviEj6lU9eAnwEbfdLa8cChqFldSTyH0uWYLDllaO8tHBwV4ZSPZQZy
	MsaODDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJdg-00000007TDK-1qsP;
	Wed, 24 Jun 2026 09:11:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJdd-00000007TCv-0VdO
	for ath12k@lists.infradead.org;
	Wed, 24 Jun 2026 09:11:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5tqfj1972117
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LnKPMbaEz8S6AzH18qjrZcejfBYDxVuJNEStVWJFljo=; b=TXtPqNuvEOUvv/KV
	Mr4MDh9QVHOixqNFc8erdieGIfi5wb6CKxtRtQLxqd2s0PTEx6nsSt5Nd5Xt46CG
	8UzyALNviUZ9uArwLlu+aWKwX4cP1GIubAXiHZP222l0X2h6RpTTPAMaLJ6g7WiU
	k9lcve8FfNgivLM1kcNeh8GTangMeaTfTuHCoJC4YdVAucLNmDcrCbDgwSm0dw/8
	oX5KaG6I4+6ri5yUhPWP5mLK/AhjasHf3usFECavn1smLGqErtKurZKSpyCguexz
	rrDQx6dSGsjaAYCjR+xDEXBYzfPg4z2mVcGzjAZv2RKFKDhq9uz64RSsOxSIMqSE
	CJOtaQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f00evaa2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 09:11:16 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8421ffff8a3so1043860b3a.2
        for <ath12k@lists.infradead.org>; Wed, 24 Jun 2026 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782292276; x=1782897076; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LnKPMbaEz8S6AzH18qjrZcejfBYDxVuJNEStVWJFljo=;
        b=alEYFVMRXcy/zSJpDA6p9rf63OOZzAB0HF+mCU4J1e9TaI0E/lXKWxzz/fiZwTlWng
         OtBP6aG2uBgTQqf3ctnZZcA8CB1XVl7UulwFqUZ2chTrCoVRjL5DivpQ1IkDCCz0Z/w7
         CLWrm575aTFRveA1QeYRBo0JYMpAK90Mi2Q0HDtQPVlgvTncoU22BoA1hN+XZYULfocU
         Q6X3E9n+6/7A+WIwUWU7fyWrLc1HoPxx6RoqV3lpNs0/1fegZ5CuMGJpmRzWFmAhM9dU
         twIRbfq6UDhui1aWJDg+Hu/Uw5L7MoLKThgVZnmk5KDQMwTxZM3GlZ443kRhZodMAmie
         RRww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782292276; x=1782897076;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LnKPMbaEz8S6AzH18qjrZcejfBYDxVuJNEStVWJFljo=;
        b=ZqJufq9VWX+mTT9uNJReJNlzFEdbkNDbptBWazIjRAsPr+9GfNdMjGJ0oftXNd7JCK
         raIEk8F0js/Rn3tn3UMCleOu/+OoNTS9hrjnCWLcgEI5pR5sUiZkW5A76elnUyqcx7qR
         zFaj/XNcCWNLEsw/pxpCbOlBF2jQ6h1c8wwd3Z4u5Lf2r4g6vfiapx6jW87sN8ggPuID
         5RIDKWUa8QirUc3IoKJk9IqTHNmaxvUDbSGeEj0PE0P3gqDFQahklfo1LlE4wK8nfvM9
         t03cvJnnMq3LRR0R3o3xIgBE0kXTNN0dxzro+uKr0W5tdJ+0MqzH40Rr9Vhj6n5Zr3ww
         AZ1Q==
X-Forwarded-Encrypted: i=1; AFNElJ8pWmoNMshjGz1uebi1HBlh+d8rGycANoIkbYQTkH6Bh+fpqbPiGzt9kt0KW+I7rO3sWLX5yKk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxhfWOeuetoq69bKviWwcJIXrvVrGM/U2TbwjZOqbgrTiF5+4u
	j8Jg8fTgjwREwYMHklZlftYiJS8j4jlcIRvU0YKtbHFoDDjsKMzcjIC/EHckuZJzpoDiy1vrIix
	dr6DUfEi/7NgUKD3Ev4u8P6l3az7V6CwNk5Cd+QM4G01kfXtDVLqQkcuzcbn8OE5o
X-Gm-Gg: AfdE7clYRXQAt1BnlcwWa89tr6qxS4r7NMf9NFw0oPlcBXthTtSd1xeI91jQjqJqrN1
	48wdnwIVLF1XGwFozqeQluSfjxxnMJBba155E/EA9MEFBm/kZFsD97zEdKcN9+bmsAakBrXbvbk
	/Zu2KmteQ/AOHvwajPKkPf0pN/qIAH+Lc6iU6PVgxJsfUnTgM1oxFUd2E0AYfcUFJ82uYf2j9fJ
	f7Zb4lRdlqZHwhyQDPnsdd9fmMD+03hWGeZl2n4pQdadZckeISyhRVmIQQtNiIxbxX4OcYyWBWE
	jTqa+YiQVuFU/ukNY6/yXVN3yqOY6eRX5J8CELSA6OYrSxghYKiZuhTHuJwQhvDkwJJoVRL1k0i
	zFOtql2Sepl0cNCZW46K9bQLDOV5y8d5mwXiiQZ0zQIOwcOCRaPbhy97HfA==
X-Received: by 2002:a05:6a00:3e15:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-845952d836dmr8374294b3a.31.1782292275716;
        Wed, 24 Jun 2026 02:11:15 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e15:b0:842:38d2:a35f with SMTP id d2e1a72fcca58-845952d836dmr8374248b3a.31.1782292275215;
        Wed, 24 Jun 2026 02:11:15 -0700 (PDT)
Received: from [192.168.106.30] ([157.50.13.229])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcd1fbsm1565426b3a.3.2026.06.24.02.11.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 02:11:14 -0700 (PDT)
Message-ID: <dde0f81b-eb62-43bf-87b5-ecb2249b0226@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 14:41:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: advertise ieee_link_id in vdev
 start MLO params
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>,
        Karthik M <karthik.m@oss.qualcomm.com>
References: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260623-ieee_link_id-v2-1-8a89d71baf58@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA3NSBTYWx0ZWRfX05mnpN4ydgiw
 h/Cal4YH0d6wwl+GISCJoC9iPhfbPFBjCo2M+fA28RARWc5/QBmLvx97iErkIiZiHqBm/HpoGmo
 iuaxn+0REYld/iy/p9uA8NZkAEQ0P2hPMCRcZsgnLnQXF3oOspJV9ncrVUjhbjrsSODIZgNnIaX
 p/QFAiQRNoI+dt5U37a8a/K/0vN/zifXE9BvIc3lXF4OHagTcHb7MVzBjH3duX10C8jDpDWl8f7
 +f33ctVsDA3iXi3FOpPWWSfBau7Feu/dqOJv5YR0ra3CAqylktV+fDNpyQxDiLt2c4u5i37JBnV
 SiXmpLajHJ4O5v4KUkfIWX4ahIlrzXAyXwIfoHn3kCvM8wUep5xLnVi+O1JIaSwvrZ4XK9qgnqh
 ztcFenQbT6J1hrmeKWkMjFhPyP0MjxaM1A/jVloBZlW1Akn2i/LjJlrUYUraDOK77jSgnHcSECH
 /QNSx4T0A3k64O6YKVw==
X-Proofpoint-ORIG-GUID: 6kyVJFRA5jTOGJ4RjONvRrWkXw7BASBw
X-Proofpoint-GUID: 6kyVJFRA5jTOGJ4RjONvRrWkXw7BASBw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA3NSBTYWx0ZWRfX7rpckcdTVbt8
 feHnATV1H/aaB5fTTRyohXG/rZEjEkUOc8g18GikUls0c9mr+ju5Bi/iWB5FWTxzlegYJ6rwIam
 ZI/JdgfKVxfymOwnkPYl1vDErlxlbuc=
X-Authority-Analysis: v=2.4 cv=JbaMa0KV c=1 sm=1 tr=0 ts=6a3b9f34 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=DysFi5wBN3dAxe50r5uYmQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yCQnc_su61O_ujFCQIoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_021117_200545_FB478D50 
X-CRM114-Status: GOOD (  15.07  )
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

On 6/23/2026 11:16 AM, Manish Dharanenthiran wrote:
> Firmware builds the AP MLD partner profile from the hw_link_id passed in
> the vdev start parameters. However, hw_link_id is not always the same as
> the logical per-MLD ieee_link_id, since ieee_link_id is assigned per MLD
> and not per pdev.
> 
> This matters in mixed MLO and SLO setups. For example:
> 
>    MLD 1 - 5 GHz + 6 GHz (2-link MLO): ieee_link_id 0 and 1
>    MLD 2 - 6 GHz only    (1-link SLO): ieee_link_id 0
>    MLD 3 - 5 GHz only    (1-link SLO): ieee_link_id 0
> 
> The same physical 6 GHz radio can use ieee_link_id 1 for one
> MLD and ieee_link_id 0 for another. Pass the correct ieee_link_id to
> firmware so it can build accurate per-STA profile elements.
> 
> Add ieee_link_id to wmi_vdev_start_mlo_params for the self link and to
> wmi_partner_link_info for each partner link. Populate these fields in
> ath12k_mac_mlo_get_vdev_args() from the corresponding vdev link_id
> before encoding the WMI command.
> 
> Introduce two new flags in ML params to indicate to firmware when
> the new fields are valid:
> 
>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID         BIT(18) for the self link
>    ATH12K_WMI_FLAG_MLO_IEEE_LINK_IDX_VALID_PARTNER BIT(19) for partner links
> 
> Firmware parses ieee_link_id only when the matching flag is set.
> 
> Also fix the debug message by using correct format specifiers and host-endian
> values instead of __le32 values.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Signed-off-by: Hari Naraayana Desikan Kannan <hari.kannan@oss.qualcomm.com>
> Co-developed-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Karthik M <karthik.m@oss.qualcomm.com>
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
-- 
--
Ramesh


