Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1805B606A324
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zvddiNCZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZgOAUXCI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YNsTe1tQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=; b=zvddiNCZLvD/nf
	KF2EKexrwP+F9G4EaNweg7vAB5w2SZPyfGY6bU3Uw70D9yl5DDyKnjZMTE5ept+PB19exL+xUJ8lV
	UAkJL6s/J9rMyORm5E4/JQPvghY4EU8s3wgjMJE3jPRjfr/VqrWWwvQtC9Wo1IYNKB9gWF4i+f/F4
	/n8PAap7AhuDXEXu5rg0jvi96/gcxgqvL+n5Rzdik6kzjvJDk0X3Th09egXbaiOyxOrOo5lcQ4+eO
	QYZ2pGJViAr/DMYYb4W4xqlZMgbcpEFJ8UnHTsMvjrghzyxLbXoZBbvaF6vQrIGRxqGNOsZm3fOH3
	hdtTl3EEljMHhGWHUsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDop-00000001mCm-1I9k;
	Mon, 26 Oct 2026 06:04:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDom-00000001mCH-1pxF
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 06:04:25 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7nb1907890
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=; b=ZgOAUXCI/uogjmGf
	vE6Z+6CTlJFkyQqKh39VbkGSrr3a/Py/RL4/zXanDlb3ntpzWraW98/w6xkP1gOt
	h5UxUJGz3xyq282OrCyHzWS0Q5if35XmO/r4vJ6fJNBFJK082TNzyggokOpTL7It
	DKwWnGHIUjc0ORZlejGWlEQX2QVcmVDe27BDZJuogN9DHww9KEbIkNGQBLfLWeov
	lY3RlBANGmEFjZ92KmV3qDSVMRbdyTzw41q1mBbo0mdPAM+a6kuyTLUNAonxrnyd
	HZ1rPsFNWU5+XuXTPyrXhkQ4SawE/9rIhtx+PAIbtPx1B4eRrEN1CF0OfLpqy/HB
	ONkEKQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn2a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:04:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so8146819eec.1
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 23:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792994662; x=1793599462; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=;
        b=YNsTe1tQl9mRrAqyB6pcEHdPOT3cSk140NFammCQF6ZmJGcWJsrTaf2Jw4JnNVMa1J
         TUZukeayMTGHaJrYoQhL5iv1h/IFcLz6TbF84tmXFdlEbQ7C5/36lZYV6xawV+ILUeeu
         /Wde3vNbWcFS+7ujySlKeDitQ1HveYEagB4jUEwuow3Qn3OZCPYDQnY2Su3T4gjle26Q
         LTQoR4eJGLvLu0sxXmPTSePQ2dcU4lvusfk2ZEENgg6CcoFc+gvLIoLHPJ/uNOibT9/0
         tHWxEnEv19zjrTtSCCFvtkzoPWsAzuKUJGarp/TevCMXrgqLeli4JK6n73bjU7rQx+7K
         zzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994662; x=1793599462;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4gxzQnQxSt/e/zJNl4TFEc4jblevNCbaEBBHPWrVV0=;
        b=PDpC2zbG9HccCwnqQAc4qr0ZuDOaLrSnfEP69+27U8oQQbwGJ6hvgeLwPM9qkkffyI
         4XgZRhtuZW+Y11q70bY+B5fMW/i3e6ewaXLeEHMQiVU1ziN2/+71v3ziCYd99RGBv4lJ
         n2/y1IS5EOes6bJB2U/PDdK1SG5jSWtavROb9H1Pj/UUyjL/ANO1Tsp5fKMIAxD3QRbW
         +feGex33x9bMClQCpHfQ3tJSonvoMdQfq34JBBDzuRHH1Zv8HBCWno2h2M5es2aTs4H2
         mREisI/sOrIgSk22R6UflKJH2mnVbGqrZHOl0fnMYTmj2equjIHjb5h1LvvpPQ3h2Cl9
         reiA==
X-Forwarded-Encrypted: i=1; AKwUvBybiMp2rwuWnDBpERW72eFkoiSpDbu+bRUe7wQrLwJFL17as66DxdrlT5f9p/pCmRx8GwJ5h58=@lists.infradead.org
X-Gm-Message-State: AFq9FYKyd0f1QVtXW2X+KffPdlfurhrJWSzcrjpuBp4QgKOyt2+zbZ6q
	14ST8JqUh0pr1ThEbSW7n+Lp5ZMJagKwc1NBfYzO776BHAYHDXJtczK0xI5AdGL3VKhcV5wgVKr
	f5BOZE3q2EABDASMqx5v6tuEOgNiazqPtfn/s1fS2ESYSCBBxL14O0SQMDh+IIm8J
X-Gm-Gg: AYBFou3/c2oIxr9VJNyKYRWnP/qeSsARcCZZqc6N5NAER+7kS8K9Fuehz2YAi5Gy55Y
	qjGor5gTt7i+TIS4SbSWUoBVrB/EzKdcky8RvspLEC8AXQS2ELIJUev+TI0U5msMikD1UvGI3iK
	LTAxnXv8pWX5IRCKR+2zuG4hX7FbcBtO/qD/r1SLJ4DUWPcm4p7p1x+BGzah5LhCmAUxpTvpfMZ
	G4ovEuvxAITIGvTVu2s92RD9Q8BXVgJZk6UrfuqXwgvVOWrynOQ7qQlw68dygOBQMjlBapv7lyR
	bPHIV6VaIFid3uZEUaC1Hp2MuF+9/KEfl61oXG/PmMzgAw1s9QDcMCubG/xgB35vcueVU/xySOP
	Ek/dxj2Jyaae8TmVHU7AuG1Y66EmpxUyOV1uupCg9uqAr5Bo=
X-Received: by 2002:a05:7300:84:b0:369:2f25:339b with SMTP id 5a478bee46e88-369e849503emr10171394eec.8.1792994661896;
        Sun, 25 Oct 2026 23:04:21 -0700 (PDT)
X-Received: by 2002:a05:7300:84:b0:369:2f25:339b with SMTP id 5a478bee46e88-369e849503emr10171347eec.8.1792994660976;
        Sun, 25 Oct 2026 23:04:20 -0700 (PDT)
Received: from [10.152.221.90] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm21955696eec.12.2026.10.25.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:04:20 -0700 (PDT)
Message-ID: <63e5ab21-cd8b-463b-890f-4c3c93bdab68@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:34:15 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KgcX91SDpwzw98dtzFNuvcx1whiDsYSk
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adeed67 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: KgcX91SDpwzw98dtzFNuvcx1whiDsYSk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfX1oFWk9wOqYz/
 ZXZ4ushWiOMCxPCfvdLewa3qYpy52Im6NinHen/uaJIQd6WqluERTgOjiHCM4EBObXWCsCPzqaY
 wBOBQ8jivE6oRRgs+ix9C9QDXX9xx70prtVIaXjHbS0TXk1Qxm8fgRQqzHeuEgV4QvfAsbRAnHd
 xLYIY1Kugr5WJhFQnHc6fWtaVvWYkwswsRL5cl/+3bKdc73mQVrg1xjbrskWI5pEumqj7isqwiO
 47jWv+XjsQAiQt+fF4FHuHG982Hg0HN8RL8XagFuZE7zJCgfzZs5qiYLu+J8xXmVECSKjhQGXdE
 LBwycHBuSDsFGq8EexyFYPnIcXobDOTDP5x2GH6UExi5GDzxzMIrcAJj2zwN4jTiJ8OVs3ByWu8
 7Ms4vWH+zpFww2QZs9/UBRNBO7XsMFsKTVR7fzewFHCv0VklseWIYkDYROM/RNOGrk73DZkYo64
 FV+eaD1JXg1W1twge1A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMyBTYWx0ZWRfXwtDV+HeJhjHc
 eeXfyBRWGSGHrAgYG8fV019e/3daxZ29qoJyc+v06B2RA3FgAIn66zgAMFgTc1vZ+nX90JR7sA/
 wP1+NONLSIym3mvBKdpn1VnqB0YCNBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_230424_605683_15027D31 
X-CRM114-Status: UNSURE (   9.76  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 20-10-2026 13:22, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> Pass the current MSDU instead so each MSDU is processed exactly once.
> 
> Also rename the helper parameter from head_msdu to msdu since the helper
> operates on any MSDU in the chain.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

