Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99551CC6B34
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 06:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wdd6oo9PhHOlz5Z+fi4fD3T2knLRhYNkfPM9ysWFy80=; b=fHcwyUnjQREUaG8OjGUOXH9gjB
	tZDNMf5Czs5fEAFCzW4M44vbnIS//wK2ekQmZ646MPlNhkGH5XBly5LOtyUkZQ8a5epYgtOa8kDay
	qmFnrB7ZM+UlhIfHou5uItVAmAP851HQPRQpZ+XXTXeXOMDy04z788vc8TpHM+204nZrdu75wuH4X
	cyXzFA1LajynD5XJAfqaphmpflgVatAvqch0/TMuDErhOqCj2qzAJUG89EUOpBHNcDCP+mZ5jdvfZ
	W0xmfJvZDVfi+VJ6IXEQhgeDHLwFI7X7AeGJlYa8ksmUjimp+cXXALSGF0wV2VqG/CJs5UipgH2Vs
	PFt7yL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFOj-0000000Gzc1-1EvN;
	Thu, 15 Oct 2026 06:57:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFOg-0000000GzbU-3TJD
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 06:57:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1Ogx31707295
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 06:57:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wdd6oo9PhHOlz5Z+fi4fD3T2knLRhYNkfPM9ysWFy80=; b=UsdVGi/+WevLHjQW
	vHOUzEBoNzaYH2BAx5UKsN79l9RJ8jjofooET36HKvUm5jPA4f9uYk+vgx37bqDs
	uji2yN1/HSf5y1yeLjY3Q2JkE5daRa5/C4H/ZE2IlC56zccfthcH8XZxr1mdRbWK
	FHRLylkML06Kzh6GuaLQV+27HVF+YWsDWMgWfF8UzQSWbzvlPR7I4QVq4pw+/Uos
	NScHlFpnjiZXuh/RrthVBFd1b0qvHTnvOzuGR+z2uc2NkR5/wFj6tjX4bn0U1FWu
	EyzMjgcGE9Jc+i8qWfZX/k6Tc/YDH4vvqJyZCi3jrFfF+OeN33938wNrcCIlPewe
	apMl8A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4han54s484-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 06:57:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e941532594so14584325ad.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 23:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792047421; x=1792652221; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wdd6oo9PhHOlz5Z+fi4fD3T2knLRhYNkfPM9ysWFy80=;
        b=UMXACAbso3B7LCtiUkseZ4blj3Ggsi7wuliOaBwL942I8f2en5MrthnViXua68f5j9
         R+pgA+dcsoMz2PT2KxyqGLBXUm7eOj9igeNF0I4TvByovs4+nJlkdmtkokZjxeeis/Kh
         o3TRy4QPgO0AKADiryqXZ3qZHLEjLExr7CTqGgxE+4Sssy0S3L+RY2rh5cnu0+1ikLX6
         lt7+HzjEYUz0Ly4yqXT/rl0HVivnl8MbHj67taFxWVTw4AJZ5NGx48jZzo3S0ZmfXA3r
         a6y+mqON4rd35FrXMBxbtHRm3Yu3StO8AEhO2kxF2f9IIAJP2VIXt2ncJEtjJUuYTkm5
         0qew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792047421; x=1792652221;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wdd6oo9PhHOlz5Z+fi4fD3T2knLRhYNkfPM9ysWFy80=;
        b=QXKw2pBvgp54JwhePggk2eEf++L73kopNfn8jhdvD2EU6lxU7f36shD+szMuIZElZf
         iSCYsR75aLO3ty+JDbctH69L0Zpj1I6FMnfWfIRWqh6Ozg7cufSlUEu1OUfZMszfn2yY
         wQFq7P4F1wTB9vtnzdQ4E1JjhAah1VmswvM02ZNoEbuZk8npLHzsvFF9B6dw1qt09liI
         49uLUUO2NBZA/G3gkHV9MJBuJHq6XdnNO5C7yqE5H8qpRwV4vnkEZV+pKCHC2lu9gNeU
         Nu621gLbHY2LEHBE8071tVZHdngPbBpDqgBJEM8PFDqCNgLZEDPAnJo0MAdDL+PDKRK2
         nm4w==
X-Forwarded-Encrypted: i=1; AKwUvBwYW3Mjl4oxiU7rG8vRoGXiMoEBoF6Gt3HnHZvchter+ipWPpQS+GlfhpbVKcz9oaGYj5mqL8U=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ/Hkq6bDGaO6C7hSHTLPSAsqC/uE2tPH/zje1WU6xczO9zV9lI
	Zr1vbwtXgwvzcwHzLGKjJ27c/j2bz5gHl8ALMmqTHTPpZXVH8FE50fw0uX0I1VD3cn0yeKsht+h
	be0ospQNKktbNNkKbwU2Deg9sKevzAx4zV0FCe/EsTw/N8y+8srtHylUg0aRQ4mil
X-Gm-Gg: AYBFou16vNJ/BH4rNx9WsPJZ839F3eQqSP3+2UTWv0UjEz3sVPJx7LOgprMQWLQCMAz
	F2jyMW1JdXQSI2wz3OPKRqo2Pg+2aGkIwWfzL1A11SAZPiiejFGKiiHfgetISp8rcwUyeukIVzL
	AoDr9oJbVkEZvG6R2iDYUHq5Iw3sg49KJgAdrLKNk4XCli2Iwq4MI2wtA3NY4Br0CWnBy/SIM1i
	7fO08amDoG9/x8NLMXt7duevKhCg7QuKOIAufhKNfsLulWt9+YWWMCCtyngmswmkXI8nhrUt2z+
	VfRvT3Eq7q0e7wXD5SQTFJa+flYl639hBssXR0mIguqYt+XcLgM4reneS58dk7Ye2GkFgwBSRWF
	POaqNM5mAMcpk+VxHxIcM44Nc2r0GNaTiXwfpfbQ5lEHxrl3RP2Jh6R2oCJKgWfATO83TXO+j
X-Received: by 2002:a17:903:1ae3:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2e842cd4484mr184465265ad.18.1792047420547;
        Wed, 14 Oct 2026 23:57:00 -0700 (PDT)
X-Received: by 2002:a17:903:1ae3:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2e842cd4484mr184465125ad.18.1792047420024;
        Wed, 14 Oct 2026 23:57:00 -0700 (PDT)
Received: from [10.133.33.32] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422c9944sm77616755ad.64.2026.10.14.23.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 23:56:59 -0700 (PDT)
Message-ID: <39b64d83-4d67-4249-9535-dd5b1ddffa29@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 14:56:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix decap of MSDUs spanning
 multiple RX buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>,
        Ripan Deuri <quic_rdeuri@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261013-ath12k-fix-descap-multiple-rx-buf-v1-1-5f3a10c4d8b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYQFmFtv c=1 sm=1 tr=0 ts=6ad0793d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Awmu5xbjiVYryZGjqygA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfXzDJ+WHjcyQwg
 vo3FxSJGU6MoYuKyNDy732D9zcVRR3s9ypdZx2ivWGyhdF1e8xVhySnSZroiM8WQgQAoOPmrqDa
 LtzqybLFkflB8Q0d9CIITJP0A9DptiBwMLc5Y29hdv6Wl9uuJSydPCTBnCsg2miCQPqQsTS74qR
 ATO2gYjbYv5EYY3zsx40ea74faaKtdZDeYpzmVLpSMO8wgeDJQvbBg8U+PIpGP0NX4rW74qPF1d
 5g0IwncTkR2Z0OBOYUG5J6EDpCu1o4CjN02z08LlYyWGgh9CZxcQ6nH9R8MunPmVbthZvclxrUz
 mIHOsy/vSj9lEJThKF9VYKBYxDr9Aqid5wT5FnMM/J4+PJvsfrwOZ37Pc5KOA8tot1GNvnPc1jJ
 GHaCZ+v+2HL22hQY0nBBlAbk9Gs2d7KJXFG/q9CUnSnf1u0JtRfnh8bizjymbqAe+KR1ugUrsAN
 c0ntkLwp2McMLOF/+ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyNyBTYWx0ZWRfX9gUKXlDI1kvB
 YCBqJE+jxMh4d6JqEQhcdBohggdpsItS7lKkdDe4qfSZ32wGDAeym136WjlMLDZZBlSLBlXIlKu
 BpY9ilCOgDhGOYJ9fOLyVOzWPJCUpig=
X-Proofpoint-GUID: tvtNV1o7N687IeTi_Z4h-5tuFKpqsSXV
X-Proofpoint-ORIG-GUID: tvtNV1o7N687IeTi_Z4h-5tuFKpqsSXV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_235702_990320_ED8D4797 
X-CRM114-Status: GOOD (  15.36  )
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



On 10/13/2026 9:29 PM, Lorenzo Bianconi wrote:
> When a MSDU is split across multiple RX buffers, the msdu_end TLV is
> populated only in the last buffer. Since commit e8a1e49c6328
> ("wifi: ath12k: Add new infra for the rx path"), the RX info
> extraction in ath12k_hal_extract_rx_desc_data_*() helpers runs before
> the MSDU is coalesced, so the msdu_end-derived fields (decap_type,
> mesh_ctrl_present, is_from_ds, is_to_ds, is_mcbc, is_decrypted, sgi,
> rate_mcs, bw, phy_meta_data, pkt_type, nss, checksum flags and
> err_bitmap) were read from the first buffer, where that TLV is not
> valid.
> 
> As a result decap_type was reported as DP_RX_DECAP_TYPE_RAW and the
> frame was handed to mac80211 with a raw 802.11 header instead of being
> converted to an ethernet frame, breaking reception of any frame larger
> than the single RX buffer.
> 
> Fix it by parsing the msdu_end fields from the last buffer (ldesc) in
> ath12k_hal_extract_rx_desc_data_{wcn7850,qcn9274,qcc2072}(), keeping the
> mpdu_start fields (enctype, seq_no, peer_id, tid, addr2) on the first

nit: On QCN9274, the tid getter reads msdu_end.info5, and the patch (correctly) switches
it to ldesc. On WCN7850/QCC2072 tid really is in mpdu_start. The code is right; only the
log doesn't match the qcn9274 hunk.

> buffer (rx_desc). For single-buffer MSDUs rx_desc and ldesc point to the
> same descriptor so the behavior is unchanged.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: e8a1e49c6328 ("wifi: ath12k: Add new infra for the rx path")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


