Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE75606A327
	for <ath12k@archiver.kernel.org>; Sat, 28 Nov 2026 13:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HhtcuQkL;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+lF8yh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YZP3qeOQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=; b=HhtcuQkLXpWI0q
	EaZPLJ+ppcIYdxMhRkUyZcDNqp3YTIxYE1mlxJKYFDUfWYYqOf45OwtLZPEce5wTd/cQU/K8EBMuK
	Q1V8s/eTRc7/AAjdiaYgpN4TArOAEi+vrfV2ZQDQxA5E19deRpvUptgxZaP3pSpmbm5ECc2LVxpdA
	ps9tyyxlpf4ckiqnfc3C5zmCh7eCnKGZhK2HkBsMkjECUYYpoRa5jLGAnPEFg1NwhPyrSQCo5cVFB
	uwHDbNg30suJwLgEM8Qdo24PffxGyje3rBtKrJCk0Lakege4aXsRcAg5WoQIZceKBZqAlJcou8zBO
	I1fNQoyDPlwXRZVljo8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIPd-00000000msH-40zX;
	Sat, 28 Nov 2026 13:24:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXIPb-00000000mqh-0TYf
	for ath12k@lists.infradead.org;
	Sat, 28 Nov 2026 13:24:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASD7Qwr1125606
	for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 13:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=; b=Wp+lF8yhgd5EagvZ
	ZlGochIrvz1wwGt2IFybyBygUZLyxb1s5Z9tL29R9F8xYL0jjJvPMvpSgwZixvwr
	K+YsVPDZiSgBIg8eyaJECboDT8pLKLN/J8NmGNTXCRCRSDqVHf6TvyhJwvqEPwuz
	BftIJlqseFFJcHGD5/aEqfMWTejPGPBM88iqXG35/t9ZGX9qI1+siL5nkYoWZS9p
	4dZyaDSm5rt3jksBn3slUfXoKvvEh3QOlj4S1GFfPjk+HHFUyRsAr2chCeb+JbsB
	iqDLAMbJ2uM7SBylGs7Lm8R/5KDUvrAiJ4geFq2rkjJVbBNFM1jckn5eU7f9il74
	zmxp6g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7q1u0xyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 13:24:17 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so879449c88.1
        for <ath12k@lists.infradead.org>; Sat, 28 Nov 2026 05:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795872256; x=1796477056; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=YZP3qeOQNuJYBnR3cyda0F2AD//ZRMkecPgKU1vVKU6253448sQTuB+2gZHAnXmDTt
         rbNi3Fj7VHWediN2GaMVVLXishXJv6vVCCrWK9Q7DOMqDeTR7uv92v7ivmdH0iNMZh+o
         59Dq1EkRLgBlb+IRC5viMns7w9SKmsNmVJoAc3bcOtb7FJDC4S0Nqny9WpJYQ3j2ICpc
         y+uqbEkLicRvEAnjgINUSgyECxCLV5MyeIjDtBdpEz9oMLm2V6gKC5arSRmZ9kNuHrJ3
         HeN7TxEqX9HhrI+tfhlDtmsyv/uOR5NR5YRqQGIGZMAsF1AFDroJEWSxrfWIlnqPT9mc
         HOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795872256; x=1796477056;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACwliXaCJJD7FrV5x6q3pmOUcm99a/XLmBi1r3FE8HI=;
        b=C/aVsCCG4h2oKCvA15eYV5g4PhuoxQCqozEORqMjbHkyxj9E0uqjVIOml2L8k5xI+j
         ThRwCEBbgJY9QxBEB88hjM1k8PYsVJ6W7qScotdl7mFBZZ6rkC2zq/VxT5d9z6hH+ssi
         1YJ+Dvvb6H7f4wDTJNFSdrGFPVGEPIRorXqmf1wgVvpmyajSRijY3AwIP2mjBwZuzpjq
         g2SVGFaofICNwwFVHG6c239tvIEA71Zp3nGQdo1t3O/z4BuQwjhsRmv8/D7Rx57EL4qN
         TK6BVUGulbdX25C8WMHiiiOAqFOoW7TBb94+U2UPrOoC5tAT3BlQyUlvhBLvWHJtpkzv
         k4Uw==
X-Forwarded-Encrypted: i=1; AL+hErGl0uPL9Kmm4IXMmCfwjcpx8EN7deJVCPdtw+zR9BoeClISXg2zP78O3MYkqZZcnuB5tvgCg6c=@lists.infradead.org
X-Gm-Message-State: APuU4Z8+tUsZ0UJ2kPvAdfB/bCH0fObeAjdFW6kDcFWg4QuL3QAPaoz/
	VNmxRzTxCje9IHU0rPjNFU+AkApkKpXnwUkE+GqA9J5gCcuwKERW9I6eK6FQfooBt7T/kXIZk1u
	NmgtoXkvEujfjmm/pM/2VdgMdnH3G/bQwxDGjcwRTZ/JyFOeADvUl9rScFQRrcrOZ
X-Gm-Gg: AZFdTZd0k63CCWw8rbWtC0aGnmGyW7l43a/U+ix2BerMFs2iZOArlixAYJe+zHOrAIy
	0guQCEhl4RBWbWF0XS4dkp5N+sm7XkGQlZH/ON8Y7AxsA2q+ORS5MH+bKqOPXTC2viUSo+BnDNo
	+byNdhsrt1HglywwjY7QrBernoLGL1K5YosSdkLRYPRQAhZkUXuv+wf7ENmZ/uPbf9AosQFZFPH
	WTXKgWVe0KOHirxQxQNDFk1b3wgZNuTFXFCldp9Dx9bo9Ilj4Cfb713wBB93TvuCbID7dL4vrYM
	ijVXOxjnJCirIVzxHxDHFx38KGGWz4rIrn9lqzOzojpHQu+f7RNLEJQEYZgk8xCR374s5Eb/Wuu
	E8MZzCDH6f4aCsw0WoP5dAOXU57tUusLdO522ZsYv57vHflFYFzbldp1nmajUdF1OqrxrmTDCCm
	DiHyjw4retk5/37kDkzA==
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633675eec.38.1795872256510;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
X-Received: by 2002:a05:693c:42c2:b0:386:bc8f:b603 with SMTP id 5a478bee46e88-386bc8fbce1mr15633653eec.38.1795872256027;
        Sat, 28 Nov 2026 05:24:16 -0800 (PST)
Received: from [192.168.29.140] ([49.47.242.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386ffc4ab65sm269036eec.22.2026.11.28.05.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Nov 2026 05:24:15 -0800 (PST)
Message-ID: <bb9e02e9-6738-4aa3-94b5-817d01c3a747@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 18:54:08 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: karthikeyan.periyasamy@oss.qualcomm.com, jjohnson@kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, rameshkumar.sundaram@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com, quic_cjhuang@quicinc.com,
        vasanthakumar.thiagarajan@oss.qualcomm.com, quic_bperumal@quicinc.com,
        kvalo@kernel.org, quic_pradeepc@quicinc.com
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
 <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
 <20261128115312.428133-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261128115312.428133-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfXw40QlqA6xGDF
 2IPqX5P2kk9o5X4uV5LTmq4+mG7WtNhiNPQIf3870NOKtBqfQQRfYr/o9VCR/39Nb/KdAHgBQGV
 cShgv++CttQKru918UYRmoByPTNRwd/BAV4PkXjsVlEV4wTgblsB7aOTHMZnjYZBbroKhHJCZRd
 nN5pfjUGSex16UYlkjLrSAxp5LbQ2C/mMPpeoppC6pXcVSP8x+Q2CC1Cp62QZz/ahz1E0hHg1m+
 Ao/QpGALNoR5FC7rJnosvhABfG3CpCIY/5g8JlRjHBTsyf37wky20sXRp6LWnozuOItN91mrIz8
 HnBD+yx1PWokiljdLILLVQLBW06NKoHKmnDkJa7kbBwRH0YLht+46JYgHwxLgGHuGL/l3263DP8
 ezyE3zZQurh1iaSVxEFjEWvizxOIRYhrW+W8chTR/AgLQltr6Gpo0wu5r0B4KO8G7sgchae/ZlS
 HsPsUdUyNcAeDJLgBVg==
X-Authority-Analysis: v=2.4 cv=Dv3Da2/+ c=1 sm=1 tr=0 ts=6b0ad601 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=gdHwamPtuzoUoDSM7zGmJg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=f3ww0dcz35mcA5LW8GUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA1MyBTYWx0ZWRfX/vQPjPVAPoqi
 4vFDNWblcovnkuKWe/zkO0hoE5bpY1padfHMNg2F+DihQbZtxkH6L8SGW5o4Sa2Sxh4o20yFWQC
 x9ASZSvL/34gy0fUbbGPMewKY8CnAYY=
X-Proofpoint-GUID: fLVbyZxtKp7A8rAMWiTRivDjiBzzuylc
X-Proofpoint-ORIG-GUID: fLVbyZxtKp7A8rAMWiTRivDjiBzzuylc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_052419_303624_D971E87B 
X-CRM114-Status: GOOD (  13.20  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/28/2026 5:23 PM, Julius Bairaktaris wrote:
> On 11/25/2026 2:26 PM, Karthikeyan Periyasamy wrote:
>> Can you explain the test scenario ?
> 
> There is none: I have no ath12k hardware to test with.
> Found by an LLM review (Claude) of the code, comparing the decap path
> with ieee80211_amsdu_to_8023s(), which drops such a subframe.
> 
>> How the user trigger this issue ?
> 
> A station associated to an ath12k AP with Ethernet decap, without
> 4-address mode, sends a 3-address A-MSDU whose subframe header carries
> another host's MAC address as source. If the hardware writes that
> address into the decapped header, ath12k_dp_rx_h_undecap() sets
> RX_FLAG_8023, ieee80211_rx_8023() delivers the frame under it, and the
> bridge learns the other host on the Wi-Fi port (br_handle_frame_finish()),
> so traffic for that host goes to the station.
> 
This frame report as address mismatch error 
"HAL_REO_ENTR_RING_RXDMA_ECODE_AMSDU_MISMATCH_ERR" in the WBM error Rx 
data path. So no need this code change in the regular Rx data path.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


