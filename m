Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37570606A32C
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 22:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5B25fFZA;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRJyP2zW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XY+/1fCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Z6Q+JoRCpMa1jBA3qbrMRWDDKgZh6Q0XLJA/i6CVO78=; b=5B25fFZABIIi1p
	2WQZOMuQaM9y+x9cVvGodzKCB4p9BwK5pjZZBiwIfnGwk1Dxvg4fzA25O7W1SKy3/zp4l2Ofj0OV6
	6cUwSpawIvBlTzMruycdnZWvKAsJrBdv47aZkRIKLTGIeTn0APag1Hfti2o1PSUQF1Fz4+mJxUPtu
	Rh/wzpP84aYcyC78rZwMAiYMCAWZtnp5tudTq/mZv1tq2/ADURhtep/yqAv2PIR1ViTTrOE301Yr7
	AT+PC9f/pbWvBw9+yvDmTfAeaoYlMy82/1TkKUfaop5Df0R1hsY8XjA7QJB7aiYWM1wYm8pXGE9+1
	gMR/0defRRor/en/mxog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5LB-000000044CC-44rU;
	Mon, 16 Nov 2026 22:38:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L9-000000044AW-1NEH
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 22:38:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfFwD3248543
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z6Q+JoRCpMa1jBA3qbrMRWDDKgZh6Q0XLJA/i6CVO78=; b=dRJyP2zWsRpPcbXg
	oavWz24fpK2YDp9dwAJs/Jp5Xtt4IEMh31/CbEl2fCtrEa/DHz5WpygdgIe3gCta
	rlmtCUDFEHBVSGX7LQadwyF7ukU6ZtApZ+2gI5kH3FKQFkytzsytC22k1XAKeeqa
	ULo2X7UuPdR01Tuc8KwJId+1q7A+OVd1IpeYQhmWr3tiOne/MTjIIm2OukHpf2Y0
	4VAXssBHEUDMeA+Sp8Jd7tn3GQC0TuTGqLTt9DmeqCpHBaEkETRpZgeHDrrC8eRx
	kkuaPeYjjdDgg5bdVUt0K9QqV6IUjOTnF+OemYYvZ67a8TRoodYW/gxnr6wmZ1sQ
	Okl0tg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j00nfjmav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so5008248eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 14:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794868697; x=1795473497; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6Q+JoRCpMa1jBA3qbrMRWDDKgZh6Q0XLJA/i6CVO78=;
        b=XY+/1fCjYSmBNI+niqmKb0iqgQQcGgxwYuYSEPn2MkCxkjoJRGKUVq+IthdLLVeEf3
         JYsbcF99auCVFdXiz5zNPZ6TTC2kqn5F1ZFUnKK4hK2SUsz89Y4pgbn6fDw59WEfrimM
         e32R61CSFIvqueX9tO0oxrwLJLTMJslOTqz7zGsXrvGeItxOrvYwvZX7JwyL0ljANH/8
         wlcIAfPn22mDz2HOZd4CF5c1SWBWBHip/LSnromXog3wsqGX6t1ZEPWV1p/Nxfi/wLGc
         hvqT5CyLsoDjoCGq2fu+TeSF9xnfNS6HorSOT7al8AIFXTfXvS0D+O28LzK4cXE9U+YK
         NtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868697; x=1795473497;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6Q+JoRCpMa1jBA3qbrMRWDDKgZh6Q0XLJA/i6CVO78=;
        b=Kn5CUF6GGsZVm2CTFgQuJ+92Ls0K2Nd7PbU4iFLOEpiF0M13/TV3Q6vsZiy8w3951y
         ICHmx3R1u/HC/gJr+QPPK5qIFIPWTNkBY6UM1D5GW1SAlRE2ugC5Nw8o7LRkT+Qk9THx
         xWwvbX1839lQxQPJeVzE0G8fumr7+LNCr37HfuNSajc8H7xMMiF+qy1FTyjsYXGEeYHh
         rGuEGJoXxiI+11EMU0pFPYcSYPJh9/5fG0dB4n6SUI4EjNY5zUdadKhD9utxsvE3dt85
         jQs5D4HJsLSflR6JVYNfazrVrYU/VHGvXbq6oX8l4hqT2kTpZMOX5ILcsTV12aSp76LG
         FR+Q==
X-Gm-Message-State: APuU4Z82i/PiR505YfaAtMQdKUzpVYUlVXn9GL9/mJ0A889LeeHh66hv
	f/qM1XszbTkG+thadLbpfQTyV2KxUU4qVx59alLS5mDcpFe2R//1k96PcJ2l3sDDeE85TwxTh43
	Zyglvm7dVS0GSlcr02IEmufyLTCTxt8CYjWGzfLbhhrXOC0Xh/ci80BbJ9ZWp0JwfcxK47qkh
X-Gm-Gg: AZFdTZfmjJQrP2l9vW6qK7uCvlgT2vszaDsJNd+exOXP+Rl5n5ZMU2zVWC02KJw1pIv
	JnnEtf4LGTqkD2ewDfG4UB8njro7riC4mCmwTtpZLef7z+p2yHXmdX1fAYHgfKL/mDxT9Wa5jVa
	F7PZS6rNXuVSKZ+ePjKKAUk3BuoWHkFN55K4aWj/mzeJcQUC/YJQ7dPen+oyRKbf9qRhAn6PNkV
	q7udym0M0yzhdIvx8wVTzgTQ9ZvPTzNlQGhzMTHawS/L2VGrFwDpmLOdfIqySaNYlNjGAqAaEQA
	U29lTRGP/j7D5uB7V2p2F8W5++7oVgDf/ip+FKVax/lRL6BowY/CBOyE1Zo7bRf80THvHl6SnY6
	vs6ykHzXmJo+doA3bFNHHK+aiX4pbOLIXBvSHaFXbBM7HDjw7MqGv3ewjNTcGzbwHnGsLXYj2+4
	bdMDUSzfu6b0+XVCfWFXiMQI/ocG0=
X-Received: by 2002:a05:7301:1f0b:b0:381:1926:dba3 with SMTP id 5a478bee46e88-3811926dfc6mr777031eec.0.1794868697237;
        Mon, 16 Nov 2026 14:38:17 -0800 (PST)
X-Received: by 2002:a05:7301:1f0b:b0:381:1926:dba3 with SMTP id 5a478bee46e88-3811926dfc6mr777010eec.0.1794868696533;
        Mon, 16 Nov 2026 14:38:16 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56671938eec.8.2026.11.16.14.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:14 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>
In-Reply-To: <20261116092335.34440-1-tamizh.raja@oss.qualcomm.com>
References: <20261116092335.34440-1-tamizh.raja@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Tamizh Chelvam Raja
Message-Id: <179486869458.378600.15360829027562318156.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:14 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=BrEIUoX5 c=1 sm=1 tr=0 ts=6afb85da cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VxkyklznH8YiVrIvCUQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX5diW7ZcATpEx
 oKMwBsu83fIC9v9l85kVlg6YFXMDbNSX4XcwGhqW1QAIKLkVNG1lsFtrw+tizo4TjOg38D0lJIV
 BGbWpMPGPKaLfr1kpg2OoRBJbbS2dKw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX3xxvgWN50/lU
 7TW79FXRMJGL1eq85zaX/QvhHeGwbOQD/5Mk4OMb05j9rWa3G4gOaKOCVQB/Cs6MXc4WWnBaNCy
 oQM2YuNO55n9RcAQkPAzU272JD3m+8P16DfoAfsIh2PL/EY2ziet8us5NQ0RtbELNZvWwzLhuRw
 BTPNsihamYE5Kf3RfxA5W6CfXJvcwTJ+KA+nv4mtbTZjTBvkeTGAMi5xDSfQfmDy/8tECBMwH2r
 shZT4KWTeWslYgl4vKjflZcw5nA2HqRZ7duvlMCgHZbV58e71ffE+DYxY48I+ObB31/jrmrAzKo
 jbumd8Js/MX0PuFyTaKV8+dB28xDcED8pzzXF/K4c+I6/7IjUl/G7OVl8MJ1RqFOqLJy9UizNWI
 qj55kk4GLCcrcBtVTyxmtZmv/HKfkVg9BV3bQPwxbl5KeVn5MAd8DpYypxwxl4BnItpvNQLgpd9
 xQ/g9IZpINdEqKGxrhw==
X-Proofpoint-ORIG-GUID: cTAp0K3SxbmueAq1uJWQh_l5WfV8EEQw
X-Proofpoint-GUID: cTAp0K3SxbmueAq1uJWQh_l5WfV8EEQw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_143819_485954_D5F86336 
X-CRM114-Status: UNSURE (   5.83  )
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


On Mon, 16 Nov 2026 14:53:35 +0530, Tamizh Chelvam Raja wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Tamizh Chelvam Raja
      commit: 4016f6c3149e7e3faccc1654db6a3030c069383a

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


