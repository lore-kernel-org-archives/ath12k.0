Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DD2CA5FA1
	for <ath12k@archiver.kernel.org>; Tue, 29 Sep 2026 03:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHi9wEzwugK0YkwalEyyK4EvAEkxO86dVF3Pf//TV1A=; b=nuHEjbln9qQblO6RbkUry7zXDW
	uadFId8pgwHEUi3yCmrk01RoPtzQKPfR4wX/AMumPOXrreXPqgduHl/ZRA4YRECBCkfM9dr3X0OuU
	0y6Oxo1JdbYZqGO7wrjV2gZS64JgIvJMlUfd2DYmJf4KKHSiGCCZJP2Zx1tfKmieVEBEIDknaJekI
	yUjWQfeW5AlMEduwysHERw1uepDEg3TjHwac0cXKRVeiSuUvnMarA6kh2p6YIxiHyI6WZ6ZUWGqwX
	0bbAx+BtjAl06Ps3yUjqIjywZAzc91UTCV2DBNaT3hM4NNin6c2PA+mKHFO5PWv8CH+5h1pIbaWrl
	Fr8+8X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOaO-00000002E1j-43RF;
	Tue, 29 Sep 2026 03:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBOaN-00000002E1Q-2PRj
	for ath12k@bombadil.infradead.org;
	Tue, 29 Sep 2026 03:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=nHi9wEzwugK0YkwalEyyK4EvAEkxO86dVF3Pf//TV1A=; b=DAe8S6nNNwTxg/wY7vbE21uaZ4
	C99jPoxEnhLx4zos3+cux0sz4DoY6c9qYrBawk7ftd+PRMemB2SSgk3damlN6YK9mS5eN4It7IR34
	EWa+/HKPkUL23BY1sI2pqB6b6SEXdSBQJs8sFc6TO8IoNY1XfkFMewFeaNwhXPry2p130zT7Z6Kka
	QsEEs0I3M25NLwej8mWM88oMwXm2uNS1hmNXdTy2U4imZm1wA3efvrQjaMl2XPQy3WZRLw4IFxdiE
	zeg+qlaSA2JQSIZYRD3QpFvmNYoBx/U3AJBVPDP6ItLpOj4bpyrFo8rsetCX/1sSTg8PMSBuw08cc
	xGqXI38w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBOaB-000000028hu-03c1
	for ath12k@lists.infradead.org;
	Tue, 29 Sep 2026 03:32:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T1BVZY3278774
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 03:32:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHi9wEzwugK0YkwalEyyK4EvAEkxO86dVF3Pf//TV1A=; b=l1li0Yu1Hzt7OxyW
	NOzHgX4R1rlq+lUVyIQ6wZEjhYdyVGGUrpHPmLYo6fH4/WxD9JMJBfNotR+kXoDf
	PWLuOsGYKl6Q/PfDFrdKWs9D0BROj6OLMK9a98WkJ9EZVAcbPe0xmbe3p0urfXHF
	8dr0qzSzjw+kF3bV6Ot8oWMpZJqvDpTOw8MF2f0z2DWws+rt32PJw0ord210L45N
	AySRSsIw6xXOgi1vsiTi/6dFrD3FOj+apRUNHn/5bQHiziCbz2WGoTggFPnm56SH
	jvEnSXocCjCCmLJbhZAZzrdQ+XbQO1ppOJ+TAlNELPIE5thqmWYg4Lz7+CyFBFL8
	aoMb1w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew0dcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 29 Sep 2026 03:32:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4221277a12.1
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 20:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790652756; x=1791257556; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHi9wEzwugK0YkwalEyyK4EvAEkxO86dVF3Pf//TV1A=;
        b=goeG74JIefXgXd1OCHSLR8CsL/C0gPW0Yibsf6PpT1Q/SOBZXWgGN5AU+QZsAVGp6g
         LV9CmSqZfehj4y1kJVW6aQMf2UTZzlky1fZ4T1LtyINLWlYOoCNwtlOMVFYX73YuiaSn
         u57NWJ4G1QRmyDDj3d386+Y30ek7ounY8VjQ0MWzQ+GetVleq8zPIx04GtUiX6XqAa3r
         qTh+blngLzAl8JgCBWjYbx15oROxcHYkivaMNuHgmo3hqrr2waLyOr8iLyjS8B12GxX+
         dIc/WjUTE7/44J5qv73/Bhb9JWvn6q1uu3yw0Ii04u1zX+VbeuF4ZJQKayrYHvneiEiv
         J+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790652756; x=1791257556;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHi9wEzwugK0YkwalEyyK4EvAEkxO86dVF3Pf//TV1A=;
        b=JfrBP9wPFizRTSbTDLlspCsHUwZ7NSXREwu6MMj7hNytq6AlfpHHoZQacYSIhkBto8
         eg3HVlmiaNXQcDrgJjPpxuEKtunbE7W7l6U17FlxesB/mVut1NqQxLWafFTsIkKpRQkT
         cIsjoVD/WRB9bReNOY4DpV33OK2JIqOW5MKGT7muNmContVMhIpPsM+CfTZE5/V5sQIp
         0vTJjIfd3HXDsPUN47uo/CT56KhzadB19iyZO1k13kVvb/7bi9V26XCbCSS9Vqjly0jK
         riv45UA9P9ls5YeXdnPBSHIb2yX8dL17JPVALgNTRLxWAprOOD/I+GHjvKXV7VKUvTAk
         6/Qg==
X-Forwarded-Encrypted: i=1; AKwUvBz397vOwW7pAKM3+THAF17WAY4WqbbLZSEtvxpS5o9cWN65iF8P/mRW5scElwp9iuAJ0p5o2lU=@lists.infradead.org
X-Gm-Message-State: AFuF++nTOvOHXtHOz1CaYwyRCqkbHolSU5DElWyOq6oq1TVCbARxB7wD
	7eC3nc4hMVQ9qrrpxbSgN/nneaFHMChqgMOUZDbOGUb81LYbuAPFkHa/LdwWzv/f511Hn8jikcX
	+dgvvBGlKR5cFe9WQe21hDCMYi5KxJfioa1kT5jQ2ODvl/gL7W+FfNlMf2TY/Mm+i
X-Gm-Gg: AYBFou1EBVAkLYre/yaBsfQgdP3ghISZN866EnfxwDIAmfB6WYTaMxLKU7ad6cDRMV4
	Ybk5H0R+bJIKwhdomzyVFD7vPTcFHdSVFRUyZhS0t85giCqArC1k1SmxQGxpMb9DAyaXw9p8QOs
	H0khTipSqS920DC22tEZ5ykPEazmgP9Hu8IQ/x1Q15L7Fm2sehgs/2Y5K/W62SaFR5f+3W3ExM1
	F82dl8MHzdXrOIiiQH9eIdnXRYF5wrK49TKsabNgw9V2VerD3E3qDarodNCvBPrPadr1arhUc/+
	ZYbmKLZpVD4ENd5a2EegiwcHa6BoA2025sRMMNqR0LLytieatkUtja5LxZ+GNL4EeB7ciBFRsbr
	X+4rzsR9jna0eewYU+oAn/O0N+/Ha/wf+nio/WKJHarJ807HQiQgCc9Otfj83rGkRV25X7HY0
X-Received: by 2002:a05:6a00:178c:b0:881:233c:46d4 with SMTP id d2e1a72fcca58-881233c5c1amr6810582b3a.43.1790652756217;
        Mon, 28 Sep 2026 20:32:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:178c:b0:881:233c:46d4 with SMTP id d2e1a72fcca58-881233c5c1amr6810564b3a.43.1790652755690;
        Mon, 28 Sep 2026 20:32:35 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e21f541csm49094b3a.43.2026.09.28.20.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 20:32:35 -0700 (PDT)
Message-ID: <bb1831c7-9281-434b-8324-ea93e3d08e33@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 11:32:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: validate MAC/PHY capability count before
 saving
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260925121739.2061979-1-yaojiale02@163.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260925121739.2061979-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxMyBTYWx0ZWRfX8xwGe9j3j1z0
 t3DKbUPOlBy4h54MRD9itaRfkt8lsmXcRuvc1VldIo4srVoaA1MdxQkxOZ7oKKM7od1qdPw234V
 lTLKlt1tT5lXbhZ+4G1EAgzOoYisa04=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abb3155 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=mfIliDvppe9fnnH-w74A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxMyBTYWx0ZWRfX+Lab7dibY/4A
 PN4L3QMYlJEOOkQEQd7Scj7wZmPDUWBnYPgmzyq1npD0z5lCxyquf2OiyEYRWrOWTe4OKe0f8PA
 AeddalQXt4Qa77P5vPy+RsED8Lk2APwme1euOTBWAmiVR1j5s9ZUFRNEhahpUuMjgQp1mui/K/4
 rZylAPp8OdBvo4hn7M2BPjK9Kyyx+MLeyFPJrY526SNmTVwhaDFSRLWyBOsvb20lyKoGbc6B3c1
 YzBCWIDUiCUNxnLnJMkuoRN094gtFHQcQ0BuBEUfV6fhOh+swWzw2iQBbltlBIEj4+zsWLJrFN/
 DwagxLXmOtQYjpAruUADRxWnoMM8wyouUAlH1YnIKZQH61p8RZQh2d7pgLOaOLCunoYNtwWoY90
 YhoLV7sztHC24AQysRLxNAlNeuttsfecJkZ7PMItY0LR2lGyD8WZkaEzEmm2gAS50OUzGlobNEs
 BSVqncwk58JGjVumVzw==
X-Proofpoint-GUID: 2YFEuE-IRl5Bi_RrnFZziO-myHXll1to
X-Proofpoint-ORIG-GUID: 2YFEuE-IRl5Bi_RrnFZziO-myHXll1to
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_043252_446340_D7672B8C 
X-CRM114-Status: GOOD (  24.86  )
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



On 9/25/2026 8:17 PM, Jiale Yao wrote:
> Firmware supplies the hardware mode count and the PHY bitmap for each
> mode in the service-ready event

to be accurate, it is service ready ext event. we do have another event named service ready.

> A mismatch
> between the advertised total and the number of parsed capability TLVs can
> also make the source pointer advance beyond its allocation.

This claim doesn't hold. The source buffer mac_phy_caps is kzalloc'd for tot_phy_id
elements, and the loop's mac_phy_cap++ runs exactly tot_phy_id times total, so the source
pointer reads at most tot_phy_id entries — precisely the allocation bound, never past it.

The n_mac_phy_caps > tot_phy_id case is already rejected at parse time in
ath12k_wmi_mac_phy_caps_parse(). The only mismatch that can actually reach
save_all_mac_phy_info() is n_mac_phy_caps < tot_phy_id, in which case the loop reads
zeroed-but-allocated source entries and populates mac_phy_info with all-zero PHY info — a
correctness bug, not a source-buffer overrun.

> 
> Validate both counts before writing any entries and propagate the error to
> the service-ready parser.
> 
> Fixes: 062ade23991e ("wifi: ath12k: parse and save hardware mode info from WMI_SERVICE_READY_EXT_EVENTID event for later use")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
> index d5160af60e00..59ac17f0d48d 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.c
> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
> @@ -5004,7 +5004,7 @@ ath12k_wmi_save_mac_phy_info(struct ath12k_base *ab,
>  					__le32_to_cpu(mac_phy_cap->high_5ghz_chan_freq);
>  }
>  
> -static void
> +static int
>  ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
>  				 struct ath12k_wmi_svc_rdy_ext_parse *svc_rdy_ext)
>  {
> @@ -5015,6 +5015,20 @@ ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
>  	u32 hw_mode_id, phy_bit_map;
>  	u8 hw_idx;
>  
> +	if (svc_rdy_ext->tot_phy_id > ARRAY_SIZE(svc_ext_info->mac_phy_info)) {
> +		ath12k_warn(ab, "too many PHY entries %u (max %zu)\n",
> +			    svc_rdy_ext->tot_phy_id,
> +			    ARRAY_SIZE(svc_ext_info->mac_phy_info));
> +		return -EINVAL;
> +	}
> +
> +	if (svc_rdy_ext->n_mac_phy_caps != svc_rdy_ext->tot_phy_id) {

per comment above, should we use '<' instead of '!=' ?

Besides, I think the right place for such check should be in
ath12k_wmi_svc_rdy_ext_parse(), right before ath12k_wmi_save_all_mac_phy_info() and after
mac phy cap parse ?

> +		ath12k_warn(ab, "invalid number of MAC/PHY caps %u, expected %u\n",
> +			    svc_rdy_ext->n_mac_phy_caps,
> +			    svc_rdy_ext->tot_phy_id);
> +		return -EINVAL;
> +	}
> +
>  	mac_phy_info = &svc_ext_info->mac_phy_info[0];
>  	mac_phy_cap = svc_rdy_ext->mac_phy_caps;
>  
> @@ -5044,6 +5058,8 @@ ath12k_wmi_save_all_mac_phy_info(struct ath12k_base *ab,
>  			phy_bit_map >>= 1;
>  		}
>  	}
> +
> +	return 0;
>  }
>  
>  static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
> @@ -5094,7 +5110,9 @@ static int ath12k_wmi_svc_rdy_ext_parse(struct ath12k_base *ab,
>  				return ret;
>  			}
>  
> -			ath12k_wmi_save_all_mac_phy_info(ab, svc_rdy_ext);
> +			ret = ath12k_wmi_save_all_mac_phy_info(ab, svc_rdy_ext);
> +			if (ret)
> +				return ret;
>  
>  			svc_rdy_ext->mac_phy_done = true;
>  		} else if (!svc_rdy_ext->ext_hal_reg_done) {


