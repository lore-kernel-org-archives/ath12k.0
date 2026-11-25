Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BA6606A32A
	for <ath12k@archiver.kernel.org>; Wed, 25 Nov 2026 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FBR2DzAk;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APAxXOZs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y6h0L9nv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=; b=FBR2DzAkeVfkxE
	2j2o0F2v2FhvXfYqjVIWTTB+V5STQg9VOAQ78BWCuUQgZ3VCbDeBb9sfPELfyPNeTAsLoIR8kjNII
	qEmaVwvsky80wQC/ec5QvidksFn85yW8P9yqESw4A4coRJyB/wqdBK0hffeGrhCeyKPhlqsN7n2PZ
	ElphpTGObKBkuN8l5gprV8c4N+/6FstamuoKFPC4Zq+iumfcqldMRv3WAzakLljuR8x9QVBmjwibY
	R+7l3tDnbejiScrELEi2prU+u0/41DwdlvuMekugofqbtPvMR+U3pquTSKMEdBuWP4ciex0OY0V+m
	GqvJsWrcfAK9OP0zj3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8np-00000009C0a-1Xo0;
	Wed, 25 Nov 2026 08:56:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW8nl-00000009Bzu-3sr3
	for ath12k@lists.infradead.org;
	Wed, 25 Nov 2026 08:56:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68cA93630245
	for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 08:56:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=; b=APAxXOZsnkjimD/B
	RATBk1kAQcUJfGCipvlo07R+RhtVQYDT5YZwEqwwY1aJmLtzax4BengNs81DeGGF
	3fIHkwaYNGfmLaUHXuEG+cpLHRbCCt5G256QFmhvRFs2eLAYlhzD2T7kKlitg5uD
	dSdQLIYOzMZHppv3yCWL+cOw/rhqDU9/LyIyy+isfpr+iB3caFF7Rc6qY13/NWtt
	yWYEPHkXFsLWKkWvXDaKbUxZdFPABrUfGy2PlZg78rM+EpDQf9FvXa0lLPsljHnC
	sFdXKlCIveKIuCheQoNpf8roPSb8laEA6LQ+/I3MsCWHcBYezCnMHhDjXzHir9NW
	w/Tzxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b804hwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 08:56:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05b3eaecso51431845ad.1
        for <ath12k@lists.infradead.org>; Wed, 25 Nov 2026 00:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795596987; x=1796201787; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=Y6h0L9nvP+xKR9gJGp8XSJk8/FiMxlLc2DdiPmxMZHTgqIRvPE45aAegWkf/Rns3Vi
         eVll4uHZt9g9645qScz9G8ZhkLDxYFXgskaL57jLDQ6z+De5/F2LWY8kCDXruFr8Nq/m
         mxzJ2WEg2NNn6rGaPoJctLh5hfOzCFi4qwFTPBHAEQX1wuGvqDNOqiwiv3Ta1YtcC8DX
         4nWGYKVNsyr589otl6vcg+LYfnYTXkpN7ovC7/25QfI88d/MRSvVFvTldXoIVHtTZcV5
         QdE4cyZfYAgOSet70ldz8bUUXE4F+MDkIrS34CUQDdaiHOtRcaTWsRJW2+I2c23d9Dsu
         tF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596987; x=1796201787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bru1LDaNvB2UTo65n9FnU7w2CkYvIeNmT7XboTDOz3M=;
        b=p+0k3V31ZSl/V8wOPh9dADxEsnFcc+HPWUekSIa8nkzrPviRFPd5srXOF9c8PpFp19
         WsJlKa1uJ6Qb6pdQFhZSjE4i11UH/yU0IpbuhqrGBSr4Qy3KmDoLJEnJS/LmVlNA4Xv4
         UIj7MRshif6KYhlL8iEcPgVkw24Td57uf+pViMytUMwEEkuoHY+/pkV90L05lTM17AXj
         Jewuq5z5FIs4xxGR1mQxqFrW43AWoMXVMdty4pi1K5K1SS8VFedBsHnfTBBhiMemNZmw
         8hsk7p0oTu7biHdezIblAu2GWaOCxh/93/zO0t0LlgbYgj/RMnD+txklOMwaiDhlvuzN
         wEPQ==
X-Forwarded-Encrypted: i=1; AL+hErF8eKREr0idx2+qhYKk79nOoPQ7vHD8n8Hdge7FQYDWhkrHfZrYq9Hdv3i77Ds6nt5KvGti7oY=@lists.infradead.org
X-Gm-Message-State: APuU4Z+p3h5CoaXlHnMgjorMD1hNdux/w5wqaxzzGdQbwdC/mU2cyZo0
	p93pp81ax6+XU0Vz5hDYvuuKNqulHeRlP5h4MoN502GWeW2FB7PMlKUm2LmUua6EoX2ksUIfWKD
	fqSp9HaRSBi1IP3xxITUeVp/WMO5s2r2bB3rh5zAgkCGQCi6a65t/uyLuklPKaca7
X-Gm-Gg: AZFdTZf3Qq31r8BKFtLN8ptn3x9ui/oxxV+jLkBpwbpwn0b2Vxf9rThKXaSuRa1RmHC
	OFD9t+9sZWDzhsPPoz+yEWuBXMiBQxWyJ54/LEOogYcPk5Rcl8INVgux/6MSb8h2C7Tlnz6MkGY
	EHDmgKwNdsZFmkv/TtDdI3jLNWszEFyYtWcNnjc2RAA4pgTyzGwjO+dI7/j9kOp9vSU0XXJZkbb
	LJo/NGMRFDWSjDXh9bPdtWe5yZFdVEDryI4+bhblR/9aZbQMWCiwjAtCqoQHgHhro9MK03oOYf8
	oYuAf34VfdP3XA8jt9I9hm/qz1xYTBlY/1f2VLiRa463Nnzz8Qz5J1V+0ewxBZdVddsCcXrn5SG
	1SQZb1xoglSniZgJfgg2RA6sBod1JkmkeSzptvJF8BNgzppfBXzAEEaLHWvWyTgO/DkpzjHxKhq
	A8ym9/zO6UkOEB+u6UhA==
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856161a91.43.1795596987403;
        Wed, 25 Nov 2026 00:56:27 -0800 (PST)
X-Received: by 2002:a17:90b:3d50:b0:3b4:d312:8fb4 with SMTP id 98e67ed59e1d1-3b4d31292ebmr4856128a91.43.1795596986940;
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Received: from [10.152.204.133] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b4b3c71192sm10551052a91.5.2026.11.25.00.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 00:56:26 -0800 (PST)
Message-ID: <e019d2d7-de8d-44aa-8fdb-e6770938c409@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:26:20 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: karthikeyan.periyasamy@oss.qualcomm.com, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Bhagavathi Perumal S <quic_bperumal@quicinc.com>,
        Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: drop decapped frames with a source
 other than the station
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Jeff Johnson <jjohnson@kernel.org>
References: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Language: en-US
From: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261122210809.2087836-1-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX8xdX7Mkzmv2D
 4Bdf0vABeZGIJbkHzbbwv2+Can3EaoEALbvgcn0bKM5+L8oEpSd/XTLV4r7zxf+3lvwhrspmGE+
 oQt8jQ77ussMA/358hEBDfON6xbrSUBSsrkYanz9sWs9b7USuwqjE3dzP+Ik2sAAu/vARaz6OFl
 TjAblpCzLJJmk868gfdRJn1lgr+Eeq0DX/RI0OXGUanYf0SiejV+d8lnHrfKFwDYBfsnhuSa2/0
 lJPwxo0oiMmjm5ZOqxsQIfXpXD6LgMilEFoJi9CDSOj2/BKvMXWjOxS1BFvjxjSlZxhX2lJr/El
 8evqj5Nas1REehLFgDPf9VY4s2400i0dryc8YGmH0/p7Js7mEVtDmXamU0CUAlCQKBKZsEGHlf0
 zVAldlCbmv1nPkhFgIZG+oFxO7rSKAGPA5AORc4iTphhpprsQfxjhBpNtOixWe113Udp45/JjEb
 FrGvR3jJgDTESWSYX4Q==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b06a2bc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=X1FsCwAd24jH_VNFHjUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 3xawOfdewE7pIHXw1uyk-gjeUQZV4s7g
X-Proofpoint-GUID: 3xawOfdewE7pIHXw1uyk-gjeUQZV4s7g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX5pjWkl9BHFib
 b/q+6B38oh+9ru5qi+YX+WPMGq/IC5uNG9+IwpdGU8QgPDRxIz1GiwjHyfgcmrimNb+tHzAAYj5
 QH4C5mP39PluQ5dDFxnxnVbdqIqxdBw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_005630_079307_154D916F 
X-CRM114-Status: GOOD (  14.57  )
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



On 11/23/2026 2:38 AM, Julius Bairaktaris wrote:
> With Ethernet decap, ath12k hands mac80211 an MSDU with the Ethernet
> source the hardware took from the frame, which for an A-MSDU subframe
> is whatever its subframe header carries, and mac80211's 802.3 receive
> path takes it as the station's address. When mac80211 deaggregates an
> A-MSDU itself, ieee80211_amsdu_to_8023s() drops a subframe whose source
> is not the station on an access point; the decap path has no such
> check.
> 
> Drop such an MSDU on an AP for a station that does not use four
> addresses, as ath11k does. The address compared with is that of the
> ieee80211_sta, which for a multi-link station is its MLD address, the
> one mac80211 compares with too. A four-address MPDU from such a station
> passes: ath12k_dp_rx_h_undecap() hands it to mac80211 as an 802.11
> frame, from which mac80211 reports the station for dynamic WDS.
> 

Can you explain the test scenario ?
How the user trigger this issue ?

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி


