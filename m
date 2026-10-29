Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4114606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ezaoncBE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a7t0Iq0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LZjwPgj0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=; b=ezaoncBESXiUzR
	vY9cAbOD23l9bHUhvqknnpSAoTcHEcpk1B/s8/3Q2vEmy6B1GrCLmUEeiwnC32LF4C5JnLJ/silbH
	lh57sNc//v8LOLYXKayRAuGgm5SH4zgk5lkBP+bjns3iGVBm1BbV4i8DhvjbIw9rYdpN5eN1OyYiz
	4OgIa5mTykd7VAUY+skHt7Puf2yHL+Lbo2AFGIRUtQ7ztL9T2JE4fvAPtpQk87zq0cSwOteI2lzlz
	VFW8WXKUsCVDt8OyfpS8vskm/QB6d9AOV6tLGaZIb6SM46lbj3JJ793mAe/uCnyMi68/aQFvPqWOu
	6yAnmRH/1JvleUdJESJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2e-0000000AVld-1Tuc;
	Thu, 29 Oct 2026 22:56:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMZ2a-0000000AVk4-0oNq
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 22:56:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TLZUI41890692
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=; b=a7t0Iq0M0KPuZETp
	zeEi42ULnFdlMa2NRLNh2m6TDVKKxqYyp+MRNHEH9k+q0YU9XHv42iuTSsKXiaPu
	ptTjJRGK4hJwmCC2X3ks/keBOMclPrurC1UlHhVfl/epenH39L+zYhRHyFEOat0S
	SXLcKVhqJ8mVaAO9VxQgyXHFDYJam60YSahhG//nIKksNOW7M7ckKzijb0AlXOoX
	TxvcZkYjYwc0MhwiYT8Vi08c2s8x2B5rwHiVB8IrBWwajeTx2cIEcvfyNFX1BsZE
	nrjjC7/tHHEnRqbjdJWlu2wY8rVgekgdUnunPblzHtF7J+66x2eo5xvYmrpy9+RU
	PwfGsQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qg8ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 22:56:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso200958eec.0
        for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 15:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793314570; x=1793919370; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=;
        b=LZjwPgj0AJOJ3kTpegpV6NxcfMuKhd68X4Yx2qGv7Mtyyf3D2POSKs6fiL8M5P7UzA
         l3ffWg+FNIhkfA9y8JX5gd0r3JEsnO+0QW9KEvx0uouH0AyPilKTguhZ/Bc2kvMLGmLW
         wrZG0dtsXMImU2Zm5F/6ljuV3oxkyFFn+cQhaLQlbabqQAy871KDAJ/anV2DtUFkmFt7
         uOLeA8aZQ1LXdrNiqHPPfVobaS1Bcw+rRGBTpIs4zldxOs1pQO98mRj3rKlEvtBPEwzF
         3o6bCL0hYr5JaN6+QqC9N8Gpup8gg2cuZOaNBZWKefSDFTSw6dhp3PiCLpeRAvuG3rfI
         Cvqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793314570; x=1793919370;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B9/NPh1A1fWAcPQ4t6Kg8NwfR41ZSnHrZ6bviMgN+IU=;
        b=mK51ETOYjcnovoCPUFMMQb9VwT5jJoWOrkj+70E7X8CK4VSyd7/XgoHdV4n73brdNf
         dcdMW0soYzKoEKadNn9LEAMe4Byrxezr2/o8Q6zwKZImHAD9tI/vdtNGVvXLjAj48MvN
         m6hymsuUt6SUGU+ZY+QvMCJ9LQUQwbN4yTEVZbHV/0cznOO8Ega6nXBAl2GjgN58ShcH
         9BcNwLaSUwStxPnjbMKJ0eYb7sgW/8h4w4qiIh0nlbLkxj1MdqQzbFeRFn5ZiRicxTM+
         rVYuxn8bciCTDbU31Z/U3kcqL5Z25v9gV84bXqeOSFmCGPfg9+XqT2k7UdKX2i6dCFhi
         IbLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLyFV27vdUq3hj89XFWm0kx6HOdTe6pZb4DCncdkBD53jreDRjkaKT/EOS6B5W+RoGiYgA944=@lists.infradead.org
X-Gm-Message-State: AFq9FYIGyO4Vb6neWv/UlgrksbnZckIO4kwMWuOppy1UVJTwBa3/IjON
	7jO6uATrfBu6G8wrAee6bAhFLVO+yQi9SwS8Y/xqsDs35M9COk4qVXmP2krX956M0Fu92PNcPbJ
	CWNNLZvhBhR8xN59IyHAW8q467MIp91fMgDj+Kr2wrHsjOEPxRjVdyreARfDGgKQq
X-Gm-Gg: AYBFou1v6P884R/b55JpGX8AEU5fM7qNLBX+yPiZnuRqdhHtULOLRLdItYPYRNGA+eL
	KpzPm/BS4wsu0/kgIRd/vAJKT9I6S/QsiSMb53KtiemhyG/aT3psQT05OIxsH3hwEIfYmXGvIKO
	iEHGfQ3jOt0XIbC1iv/6+FRk8uFnNzM51c9HF2H93QbNPAYtzyfUo19MIDy/G5sgnsYToRtdzxq
	jnsvbdmyJCqs7/wVVNet+ArepJph5yw0uuWAVh7BrVBOt//8utn8DH0sT9+rmWjpr3l58zFgrBC
	i9wu3rXfG3PBSpvY/gI0Kgm0gAd0oV7u4cJMBfV4JF8OOED8cTFEXn4JWGK10jfX/LjTq3Fyrg4
	MtuaOoQiR/wiYkF/j8lHAoQX4S14tdFXa+lM1RfU5rOnPZQyjaxetSE2LXht4dkabkQuJ8g3HJh
	h6UJ0e+OndV93Ksoc0kWLJFqLMk9Lx
X-Received: by 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr1088606eec.32.1793314569961;
        Thu, 29 Oct 2026 15:56:09 -0700 (PDT)
X-Received: by 2002:a05:693c:41dc:10b0:366:9f06:3c4c with SMTP id 5a478bee46e88-36a423f8794mr1088563eec.32.1793314569298;
        Thu, 29 Oct 2026 15:56:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm1644278eec.8.2026.10.29.15.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:56:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kang Yang <kang.yang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
Message-Id: <179331456735.1083805.6096170574741429484.b4-ty@b4>
Date: Thu, 29 Oct 2026 15:56:07 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX7T4yzWpgYgKN
 AAfFf65iwOShtbxPa2rOzzb/LFuupEGnxYVbB6s3GJNVIWAQ6Vy0qURVcUC8w9PPNW/6csy8rnF
 XT2gaj7R2rFn8+w46rcdjzZ4AQRDkgyx2GO3P0WccR2XcnF7geFrE8la8DnHwPJfIRiaOhEd8vO
 Ihp4gRtmz+Rvr1bpnU6+UVhH+yvpTTPbfZQ6cfw31RCCrl5p4noL5tO98afwQ6VuzCfEboD5Yt1
 QzdSJC0B4kDTHkDKPBkpg1tBctdT3oISEJ7Ol9UTkZDdAzxtTqjH8w0dhWCtO56gpZj+oKa98tU
 Up3nci834pHNVkBT8BgJTirSSK4+lOkA+xztwokOEphPeVtUhbQlvpq69WeboXIPgluii7S1Qtt
 wNHJ6zLLX0csyTUOnHWMiQqLoJHaGH5NSrocZSuPxLxlKUJZrSi0Evs6CToRI0wi5uI+4EJ/NMr
 5THIuscyJ8fHc5wjEwA==
X-Proofpoint-ORIG-GUID: YMLEk6VHBCotb80xO8_D1p2sXj8qGdix
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae3cf0b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA5MCBTYWx0ZWRfX9vEdaSW8Z/h/
 LyIQ/2uA8FM6/z6vB9fr3H9JUsbiV/vvqvXI2BffR7A+QxB9axDWKGV1039ivTpL3g95eFKhPtK
 QKmURBJNXY0TXXcf3wNMEr3WrJn7AfM=
X-Proofpoint-GUID: YMLEk6VHBCotb80xO8_D1p2sXj8qGdix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_155612_759462_7DD5B695 
X-CRM114-Status: UNSURE (   7.89  )
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


On Tue, 20 Oct 2026 00:52:50 -0700, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: set MSDU payload correctly
      commit: fe74d991f3387febfd57b65c7383d2d49e14e19a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


