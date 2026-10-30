Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE4606A321
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tz6A2qmY;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TLFfrCNj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDpOBl7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=; b=tz6A2qmYuWN2qc
	p/rBk66Agpezx5DgY8uGjapnvyFSKiZa/jk1faPBrJDkb2z0Jm51n8H+sRr5W6kmsLykSfFyajB5a
	tbo/AiY/HmLIBfoL1lQtPGbea8ScW/UI1LBOckX/avdzS2i5OSnkn26CNTyB6eRptg2tKRjhg7fgX
	7IfWkTENRszVUNPKtmP5UsA2RRINCUZz7y918NkbOnODCZWr/BYi+/L+k6LKvI+nTDyj4CwQRgnB/
	ISvh0gzKQ/lbtEyL/D4TodL1MzMTkRCdY6s5dzsumPBwCeNYmjWRgiqiaRPfJAeTC4AG45I+GX4zH
	vcQnkG04758owyGhKUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHr-0000000Cgma-2nXb;
	Fri, 30 Oct 2026 22:41:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMvHn-0000000Cgku-3jAd
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 22:41:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ULtGYJ3463055
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 22:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=; b=TLFfrCNjrTTxgqnn
	jxpH7DzAWxcamJvHJR3iQMrEe+bf22GGqFX+jDICN8vl0GxobHdgU78l0HJi8K/2
	UVw6x0zkbgmPoo/RjckWL77qFrlxvCzxDHB1AsA0ScbjMw6IyaVCwiNwB4r4Thqg
	wc3x3HMst9G98KvAC8+rTCK/P+iWoquOVRybUlbNH/1/lwOkb7aBH72QTbSa/B8h
	w/bGHbpMpC5hlSksroN+cR25Seh/7kmeh5xOZSuQ4+tlhmjMF1p5h7abAxOlyRtY
	08Vdx0U6ha9eL1s/k2dwU6m+8/0z3cxytsfQxlk4eviPJH7gQfc4E0LqwvlcksAY
	1jjjOA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn2x087su-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 22:41:22 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso2882208eec.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 15:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793400082; x=1794004882; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=PDpOBl7RlyR8xdq9W8gjhdxoXRQSDv7++/nLewJDKhqBKRvFFwEA3QBKqOZ6sd/7uq
         pnFsEvRsdh56JByokBDRaBEIhB8Df10k8XWgZ6n1DNuXl1N3lmlnwYmlMWa9P2oUSnpT
         NvidBFbRG2lH7hBLN2sykhucCdPjEaKv3ue+ZU1o5gsIiJPeOcbnACOI2ialAYYfqZ+p
         qdhr4CbM5dO2jVOJsYVrq5GJb708++GhqBYlOE7faVdFug/j5M3Iw8/dDZ3NQAl+uoAY
         LZ5s1rWcY0uMmGSJbZngPmgqBCAGIc0PFIYAlwnJD7BqBKZdbw6QmzfX4OMmYOYo4a8f
         o62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793400082; x=1794004882;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M+guSwoUUJbW4+q61V10waj+erZ44ZYQ+J9aHIJa7c=;
        b=LNYdg2YhQL9dMPpCCh4lVLeuqbB7vhM8JavIYmbmquXRTNXRlSUGRoDZJQPCxWuaBG
         /4GzBIfzOefiHKzR5FmWjyJnaNBHgXc+a/8GYAods23LS2rQivqc/W1+mdU9o8C1EKq7
         E2r/zDxIIUesbqUSGykRQ1Pr7Vq+vrx4h7v8Q7gaop56kaRj2/lMKMM4DN+t2hYvcEm1
         M3HEQA5gL4BWANyoEqcKbePSx1I89W7JV7B3CJegsBkvNhe/1KOwwx+rU8XKqyw5HMnR
         UJwWlf58Fe2JdDnEO/4AauXyo+FgF77V/IWpZotQ3TTPeeAIHNafziih2KnDm2weJuHb
         6+VA==
X-Forwarded-Encrypted: i=1; AKwUvBz7G1SkQOzv2AAnNzFVlu5XG7APG1+e+lfOgMcgJNZd97EFhutUFs6ZZkr6vdAH2ZmYxrFI3dE=@lists.infradead.org
X-Gm-Message-State: AFq9FYK1Gr3eNc6NJvThtnoqwTRs7EiQrC2tjDFYyYGR8vxoNpx4Zj67
	/X1CsEidc53xd9zojg2+goH9yZfeJOqR1psx1w65+XxWv/THASSPgqrlroAZlhU7hNEsep6rIz3
	P3/RJ8kZV2QwUNtK2TdkvS6zzV4/h70Cmzb+vjrzY8a6GvorG6Hd1vsT9DZjWeNYLxABD9sYs
X-Gm-Gg: AYBFou2rqTkm8+DRRoGt5MKcB7TNSBU6tHLNK05q9Ijdu1LZCnFdbp/3ZugOSqiwn8M
	T9he4lvnlBqwcTr5K9Ca8WMMlC0fFG3fZAX170Z0zHKcLBPLnnlMoJX0Zsgu0eo86GtBPX5zaTp
	pwPWYRHDvgtBdZmAU07ZoOgjW25jhdPACvYT/qCjYj5shKOBv0LGaFFCFqfk9Q5eBQdH53n9vLy
	oDvHLRHPZAzUzGngpXcTU1dxbZqp71VzUBhBNJO8k8ztmCOlTVYCfkr8Cpdnf7XAQLm44r+BsR7
	bd3SNs6Xur0IJ1JvyL1YhXyPLZUWcySR56n0hvfxXFkqMos16PGDCazR4sKRbb05SKeI+xuaiki
	WvRKjONoHKkZ3kNui0bvVsKdA2zXiNLW/PwhZ+g4Yp94YLd8HL5fEEUjZx8/vOxQoh88MkZXa8L
	dzlsmrmhgoh3p7Q4cUeku6rPFn16A=
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570379eec.13.1793400081599;
        Fri, 30 Oct 2026 15:41:21 -0700 (PDT)
X-Received: by 2002:a05:7300:ce86:b0:35e:a225:3ba6 with SMTP id 5a478bee46e88-36a424011eamr4570352eec.13.1793400080933;
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm14002245eec.16.2026.10.30.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 15:41:20 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Andrew LaMarche <andrewjlamarche@gmail.com>,
        linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
In-Reply-To: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
References: <20260907-ath12k-calibration-variant-v2-1-1a9d6c47dade@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: wireless: ath12k: allow calibration
 variant for WCN7850
Message-Id: <179340007978.1790611.11188538641227151930.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:41:19 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: w6PKsveWi5XroIptC9lXC9WtPEh-RIAp
X-Proofpoint-GUID: w6PKsveWi5XroIptC9lXC9WtPEh-RIAp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX4/w3fO/HCFVY
 nI37w/6xdA97o1CxVw1zcmh9/Va18KVkENKgH5zrxWipGGvN2WvrFawlec91pOMIdRozQsS3WLD
 bOLctGW46sP67YzLzEiZlww+hcLyrdU=
X-Authority-Analysis: v=2.4 cv=WfKZ+EhX c=1 sm=1 tr=0 ts=6ae51d12 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=gIeeTYuhQ723c2I_zY0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA5MCBTYWx0ZWRfX8fjliK8c3USg
 4F6utuUFjkih1THQdod6PN+Wc3phJ4QmxKUC1V3zcGnyv+62FXcphBKL7FhGgXZHGm3Ah2KRDG1
 voQTOk3uZrIqw1A52fEQDFcnAQGC9Ys3I7BAWGwlAlcTpYziMURqgltNDUEtDYNfT+Q0jvtmk83
 RaH3K0NXl5hM3ZCN/hBvl5rIZ9OePKahvERjKlv2Ld0rQk/uzeOSrWWiQZbXQvskOKQXoPzCAJE
 fkWfwHZ6aTD/mNqNsKFZzq6AquEfPlXE5jsgxQg3+2HUA0ywp+tBJIUFWkC4frPqK8mgnPJxnfY
 CLb+y7R3mPVgtGjbjIJOBwDJ71xUC0LailoO1SdqufK6rHmzNAbFUjcgGmE/6T2REPR/jx16+pQ
 dPu6TYo66iZKZuGdeRz8CVe9h/VxNdISKfGabAqdWNvtESKiaPqSLevjG9ChP6paLdJGr7Y+Swi
 jYrTLC0nGfTOClZaGWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610300090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_154124_401790_D110CD8D 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Mon, 07 Sep 2026 16:17:20 +0200, Ernest Van Hoecke wrote:
> qcom,calibration-variant is the generic Qualcomm Wi-Fi DT property for
> selecting board-specific calibration data when the device identity alone
> is ambiguous.
> 
> Commit 06cca100ad08 ("wifi: ath12k: support calibration-variant from
> device tree") implemented support for this property in the ath12k
> driver.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: wireless: ath12k: allow calibration variant for WCN7850
      commit: 75bc725cd92b2b4dfa76850ce5983aacb52d894c

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


