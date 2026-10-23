Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BCA606A320
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 03:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ThPu+uTi;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c2/0eV5p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YqE5J6Kr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=; b=ThPu+uTiR4kVdX
	MPgthSTMwbfPjjn9HO+iN/azsuakVX4IKwQMS/GtvkFJhZGw+nG+eXDXgnGGDxVvtf0LUulaq1q+n
	M1oAoXYGsGGasImS2JXw2g9cJJRPVZaLnqZvnr82rS18kz96DC3BHnN25KlG1BAma9XC2Rd+Qee58
	qYFLaBWv1QBBpRnlc+cBxnYMb0jsH4GFWjttszEZYI3812ljBxq3CIhio0v1VsraLG+x6JqyPiFZn
	+ES/SNeBNVtmxxjGlvtfdSth+jEnPxHNWb1h4bXdqhwnK6/8lkoG3IDpJAm5eVws+6hGpNIripjIq
	/7GuavI9K1/d84VQErQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5jM-0000000FN9n-0Z4M;
	Fri, 23 Oct 2026 03:14:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5jI-0000000FN9N-3LYO
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 03:14:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F2Je267933
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 03:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=; b=c2/0eV5pBeOc3Aac
	EddJmSPcQpZ0iOgux1W22RkgzjpeZI1Lr42HNgnYCrpgIbQt8ZPT6NLWWtZmrP2f
	YRnUNQtEaE6ASOmGGett3lTRq+VmsbKIhzs7l0zkvMs98ROiJXlh24Sb2T7urOmk
	5aLXXy9bgsBFWmJgiOJHGlem53L0uAlcaiZ1M+80Wj7S9aEm94N6qb+ykILs9S0O
	cD0xIGTlwnKAvYOJDdEQjHWGFo8xawyXEky1nsMYGo3dOOu75EuGSqvx5rRLjEdM
	EWFb63jBRbfug+xSknqOasOkOVmrjLPE44q9tuM5sgCNqOpkmZW+DOR0sCyFMGdb
	cod4uw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbhn89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 03:14:03 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd8b299b0abso270769a12.1
        for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 20:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792725242; x=1793330042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=;
        b=YqE5J6KragFGoA/V4fj6avNJcfL7lVsnXrghwSQhGu7tAHywOW/ra682sUQP5iWLHi
         mgBiTcL5g7Y17tRiRx4taIwP58/6eTugSVqsz+2giADyhJBc0ccgsDghCJ68YcIfFWYg
         l6qSJjWJxlKpHsA1fn3TMVpLZ1/DwWo5BE9RojNqqaDi8plU/46Fkj8R9srEHbE2a29z
         nzyxRI8Hi6lqUW3VyN8kLxS3gYCzGwy3ilyVQuUDtOz5cr7mnJYoPKhyVMMSZUQ6UFYK
         s2VKnIsq4hsDr6gHL7wogl4cyu+vOw4yJcr6wXh8WXzH2YPmyCkfyJ1unPKtH6CH1fNd
         d0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725242; x=1793330042;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4QYmaKosc0eqCjBcuMLgpeZCWwCkKpgCeWv4X2n4lI=;
        b=WHXOj7+4oCBLTmhW0Q0WtyMkPST2gKdGT4mnAz1Iah1kvTcyCKc0R79C/sVFRZ79mn
         Oi9OlPodXRpMZEvpeo/70yfBuCucHZwiMhm0YjKkuisF9Qydudw8fB0WucgSsqHrCUAe
         U4+K+cGHdREDdLjePlqm1Qwa36lQnMfYNqjRRdDNN6FZvPAqtTsL2zy9xK0UONGBQNsz
         EbJt5zmH8IimDRB38OKy4Wfr0N+AhCqjEEP07J7db98hqXdJVrF9JvgyutxDO2/0boTN
         QbdJNpJjPLtyuNzd+6krWFOikoeKO35R0Ufp6uCd9SMwgMd3oH87oeGy7m0vHmmQ1tym
         hkMg==
X-Forwarded-Encrypted: i=1; AKwUvBxeWwJdnwtKXRJmTp7OqNpQXeYp805WuT+CarnOcSBDYT1jtnbT3Dqwb910/JYHQdCPUEOKJqw=@lists.infradead.org
X-Gm-Message-State: AFq9FYL/h3IHQsRMufOLq/i92D25Cruzb6oIxeNt3Yma2Ti6vtyjj8vf
	Kvwr+fS7YE+ZiBgYlxmKnPQsMZdaLV29DaCpRYsl8+9RBQn3pr9xasLWD9RmoHVsIDfPSvU2/Od
	0+W/KsEc9iVLlFNPTFb/SyDoL+5trUA9KTGeDyg3sHA7hKtFEGqibOaSlzNi8J+d/
X-Gm-Gg: AYBFou3T9dVLkC8xxM88jzQW33Uo4sM4r4Vhnx3jAn8c6EThZjdk9mXmaLTul7bkPAu
	BTYZp+/BnwbM+4Pvyfj8PatjrH/r24GnEF1vM9RprHTym92d/FaAeBI2AypTaOmNc3ZfQ8SfiRf
	/reuK9HDDsPBgXdbPMYv12jsVIkKydMNzodirGeXmSbrF7utpC2xY0+M4DqUQQzS8hXPspv6fiG
	nR4oPqHDHSq40Z33j8vf3RaW6StaCKKjmU9E3+ZnHT7gLLedXgaUlyGZzbdhcypCc86Wl9LKsSA
	ZidIbwmz80wyZgYuCfFPz+6N+6GGn0kpgLo4WtwEtUcp4n42D5NKcwvBfvLZ7ZAw1kkFQZKxKvF
	qJSzYPbkpFPIU37V4Fl+ZPrwzO+Ibq/skp3JTFDMIdDG6zF6QGgWxO52f50N0KXAUMAIxn7pB
X-Received: by 2002:a17:902:db11:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2ea7cf79e57mr10605295ad.62.1792725242039;
        Thu, 22 Oct 2026 20:14:02 -0700 (PDT)
X-Received: by 2002:a17:902:db11:b0:2e9:a166:f7fe with SMTP id d9443c01a7336-2ea7cf79e57mr10605125ad.62.1792725241501;
        Thu, 22 Oct 2026 20:14:01 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7b369900sm4424225ad.34.2026.10.22.20.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 20:14:00 -0700 (PDT)
Message-ID: <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 11:13:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX1bbiG5OxHFw2
 rsYyTDrZOdzp0/B/otbuNWdaGSOhtLqQo9qC+jF1JcQj3Y1pqP3OuWa/6+Jv455qmtHlkOmO0rj
 pfNyDc8tS97Zsp3gQSoxt1tBhAYlXyY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxMiBTYWx0ZWRfX6JUAsoNHEKnX
 WuDFfedeMN2jCGhQidBonE5nsxInjHbyZ4lYedwjUynYbVbP09UpF7+jazvW7guQLxG4ooYk6n+
 EZNRDp2lrOgA2eAOZVLua++sFgcg2z83CbJG4Y7QzuJ5FqgDXqIt5phBiErUs2OoRBNZM3MhHl0
 54uI6ybBFVQyFB3mNEYqhfl0Q9OeEm/m5N+A2zXxyJz9tu1cGTdXV6SXs9cr0hy9cc7TfC70TjE
 ccRmMAo5s93/IJSK1r09eXq5O2xjvvroTbyqhENiei6+H37ldY8KYn45nQdf5lJmBP/KrjhM9Ul
 6dZPlCzKvF53YAZA/7K+VOpmAuPrpHtgnBNMQ9Gdd04mS8HuEeIt1C+KwePrj0yjq3kySX/giqi
 7MT6MEXFJJtfUAYaylbLoAREGQKtyAQ0TmrLc16m+hyn4vW6r/AcjDcokRgnAFAqZnY5dyP5MnS
 +OLJGP12fEHOOmrd2Jw==
X-Proofpoint-ORIG-GUID: ydQUKAjWKRtOHCNSDdlsPzSX5Ar7fDOc
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adad0fb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: ydQUKAjWKRtOHCNSDdlsPzSX5Ar7fDOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201404_978133_623C0E87 
X-CRM114-Status: GOOD (  14.59  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 10:43 AM, Shawn Guo wrote:
> On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
>> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> 
> [...]
> 
>>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
>>> the ath tag (working). It lands on:
>>>
>>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
>>>
>>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
>>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
>>> and works.
>>
>> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> 
> Thanks for confirming!
> 
>> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
>> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
>> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
>> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
>>
>> maybe I should submit a patch mandate this rule.
> 
> I'm more concerned about how we would fix the regression for 7.3.x stable
> kernel.

we can try to ask stable team to backport 15f7603b69a8 ?

