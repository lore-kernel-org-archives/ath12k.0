Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32990C982CC
	for <ath12k@archiver.kernel.org>; Thu, 17 Sep 2026 03:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=; b=fuKwq0WBwWXlmwNdquYQlY3HFx
	hR4r9FfSnYHviidU64eofLTJaggu4/x+67sKCuyKEtBwLXDJ84UrbvJ0WwBh4OyNblFwdmKP7Cano
	9Hf0w8oUrJ07lzQrei4IAIGSl43XU35pd7FguD6R8kqmYNZdE705Sjhgo47JXbWqNOzMHfGEofZ1E
	n//xHLOmXtr05HIttCTC4f8cMhq9qSDwBqs+Ud3NiFf22UZoh6zBe3ShzAd9ImCjqM2N07jWHQQRf
	aX09FpHJ4IL1eqnr6Ao13luBXtFP8F2OG70Y8irc6h3IayNVjBomcpOSe4COd7kxZADZ1bK5LhM5n
	p1oUlpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Td-0000000AVXY-3cyM;
	Thu, 17 Sep 2026 03:07:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x72Tb-0000000AVWx-2oSn
	for ath12k@lists.infradead.org;
	Thu, 17 Sep 2026 03:07:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GMd3WP2600437
	for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 03:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=; b=XGUyAhsiSSf4ibJL
	HJ8s5IV447hEWu3UaG/napa2e7oeGY2/hn73H06enD1j6ojitvTEhejF2dW++lIj
	GxIiwVm07MLDhvwm45r1LAu0Fu5DP5BRIS4kwMSYEagMHrLLxZH7kELO6PqO70Ug
	gBCz4hCSi8f1YWLAXDKBYWrzF0pTLev9GCaocAu9TH14CT/+PlDIH92MXeaLm7N1
	ePVHzWCMN6vilRGoYrcPUT1RS5x52BfshIRNxNMVcMAMq9I4CKpd1WnqNjNRTPVx
	1tpjoQQwPUw63P932dObFXjSxKqybcBVBMrwIkOUnqW2G3kUysRL28EVG5H8NqC1
	2W5jVQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb37cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 03:07:54 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so509698a12.2
        for <ath12k@lists.infradead.org>; Wed, 16 Sep 2026 20:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789614474; x=1790219274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=;
        b=JyHskR5f1gaa3MAcOuHb/ZYLqJJGS+3YPDBuAoT8uRbO1GbPEeXi6M573yNDPsv6SB
         pPX7I4X9tAkhDiw+Zl8SYhUXMaOLVL/2FBns8jNN+f6+hTFxmpw8K1OURr/PWaPHR0k9
         0juVyQ+MCVujo5/MgkEddnZP4VyEq4jT7+Pk3MCeafNS0xwsta77FfL28IWeenAUO5vi
         T0hBm8ThpAtr1ALNbJBbTMNusZK8D5Q+vtNISPMPp7oJLFhmAIAXq2Un+9aQOZA2RuvB
         19+wtXkiD3G9Yh3FhSRq18IehVH/CwtgUCGnIvot0ClbZ3jRgrEXHCH4pPxyEnWsEqll
         Figg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614474; x=1790219274;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/2v5Ij2HkXLd7w5QHHLHFy8fu/Zau4E+h+giE13eitE=;
        b=sjLZvaYfdc5kf51XNzQ2D8n2E/pZ42flw7f9X3jJK7djxuiNqvhoNfHyxv1CpeM9Zd
         GeP37rk9kdRIc65sp5siV4OUUbYMTZ4LQvjNe4v6TEZsHZ5+ayUql0T+I3BqVoHBwp/j
         43umpGqXbJ9qk7u/+i9FxKekt5F/EQB1TAXy1/eCLWsUICjynWz6jBCezhi7/v3nRIRY
         BWc8/BYtpDKo8mJQibawcxAqrC2oWjecBhEXx9juc3G/1ZwJQaAobfhtszfJRlV8zjXm
         0Vh7XMaV2PgRe75fnWNZtPZ/ob0OKlJsBDvT/moZiJekDzdr0hyRqLX3XDOJ++tUdVqO
         0P3Q==
X-Gm-Message-State: AFuF++kUde/UV1Ox4Qw+0F9I5IVeLDyP7u1zZrtg2/5z54/oDsd/ETg/
	jSYgCFLlAwwpmXw0NjkDsSCrVtenKPMzroNkBsDV8qV5WLTCYmx8rkKWnGaeK3JY/v1/V/2dd6g
	/WqvumLkG7k9pk411jlIqftkb7zY3987NUkuHaStZhKLJPLcHaXXZkXtZZvcmy1dXdpWqc5oV
X-Gm-Gg: AYBFou3FN0TPnmzlDYrB9zje/eTRlk8RGZxhukRKwcMLtQdf360Lhf7juWICNM1kArJ
	jNPWPc2cqa06IkZa9lkZeMxw/DmtfUR84KgscTpzoBTayEpgquE2X1CRXFCPsO3iWVawM2hGuh6
	lAHvhfzDbQYlUcvAEy6mGxr50cILyPaQy58P8ZNV+O1vFpISUm7VeVyn1iX3RW3yEUPFuDeUlqE
	F7jeToaE5BI3BgwdzjfT81r4jhzIPmTL3XwDXhpb4iLeAJcdz3a+KAZcduyLwUZ5cbmZQayFEVs
	QJSH7mY/90Ry/2cxLoo+19xEfPuAF6HIceFEc8FkvTxrwKn4+ZvbhhFabPXMl9Rf7AGGg/qA7Fm
	RJsb+oBDG9H/zdm4A5ejQ5uZ7zKfrVunM7OjfAWd/4iTVSsUNnbpJc7StuQyuSxZDonrGAsjq
X-Received: by 2002:a05:6a20:4311:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd5f448831mr11834378637.8.1789614474157;
        Wed, 16 Sep 2026 20:07:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:4311:b0:3cc:f008:8123 with SMTP id adf61e73a8af0-3dd5f448831mr11834312637.8.1789614473570;
        Wed, 16 Sep 2026 20:07:53 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abae95csm2452404a12.25.2026.09.16.20.07.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 20:07:53 -0700 (PDT)
Message-ID: <670a6d6d-2d95-41b2-b64a-997a39d4f320@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 11:07:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix chain-mask shift on 64-bit big-endian
To: Michael Pfeifroth <micpf@westermo.com>,
        Jeff Johnson
 <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <aqqoAVbsVu574FwT@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqqoAVbsVu574FwT@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aab598a cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=81S0BUt_Dk-okXjJcTQA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: _kBzE2TbUdPKe61SaCt4zL0gyzBTywpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDAzOCBTYWx0ZWRfXwL5jeQVSV1x/
 +b4hanfmmrPp9Qr38+5KrsvFB64KQhygk9hMf/CrYpDohKhreR0kpK92S4wlhcC3r9gDvWAI1Pj
 fw24HJwcotvdqnRXmWqO5vSJeC0uNfiL/HWw6CQvAD5Sp33MF2Ng4Jn4kKfrqqn4ii1lbHKw/D1
 yopJlhKUK0gCgKz+ouZka+IDhwucXhDF06bDarJHS4QPQvbBTbsIBwMS6zp31nPH7j2Yfa1/xI7
 vaAhkqWoL4vgsu8cDJkG8Phc2ISywWH7NPD2SjREFWvRa64HJd9SHZAuFtgNZqjN3NFF2JRjFzE
 tjW4DPH9KEUEkco+96UbxgvzGoALVu2MFGzx98FTm73M9tA2bt+qGHHo9GDAo6X9uUL/1BfOxgk
 gHykJDj3IGMjDYbBYh8cOFEYVL16bXMI4IpinVd/I/lilO77b0AOBLAknp8zmm1xpk0Kau3WTh/
 i6JgAjEdpkY9E1uKrXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDAzOCBTYWx0ZWRfXzFEfsK4hsXd5
 gxyX+y9jYIMMQkBEZuv6GjwPzEnRfgvMR+aLCbUaKkhIR9ukWok2sX4QPF3/h6E+m5KYes77OwX
 ygs38DQ5ndRLUFv9UYeVIoMBBG1OWLw=
X-Proofpoint-ORIG-GUID: _kBzE2TbUdPKe61SaCt4zL0gyzBTywpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_200755_719715_88A1EC43 
X-CRM114-Status: GOOD (  15.19  )
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



On 9/16/2026 10:30 PM, Michael Pfeifroth wrote:
> ath12k_pull_mac_phy_cap_svc_ready_ext() derives the tx/rx chain-mask shift
> with find_first_bit((unsigned long *)&pdev_cap->rx_chain_mask, 32).
> 
> pdev_cap->{tx,rx}_chain_mask are u32, but find_first_bit() treats the
> pointer as an array of unsigned long. On 64-bit big-endian, unsigned long
> is 8 bytes, so the u32 value ends up in the high 32 bits of the word while
> find_first_bit(..., 32) only scans the low 32 bits, i.e. the adjacent
> struct member. rx_chain_mask_shift is therefore computed as 32,
> ath12k_mac_setup_ht_vht_cap() evaluates cfg_rx_chainmask >> 32 == 0, and
> the driver advertises a VHT RX-MCS map with all streams "not supported".
> mac80211 then rejects the VHT capability ("Ignoring VHT IE ... due to
> invalid rx_mcs_map"), so the link only comes up as HT40 and never
> negotiates 80/160 MHz. tx_chain_mask_shift happens to scan a zero word and
> stays 0, so only the RX side is affected.
> 
> Use __ffs() on the mask value instead of pointing find_first_bit() at the
> u32's storage. __ffs() takes its argument by value, so the shift is
> computed correctly regardless of word size or endianness. The chain masks
> are always non-zero here, so __ffs() is well defined.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>

ath11k has the same issue, interested to fix it as well?

anyway:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>



