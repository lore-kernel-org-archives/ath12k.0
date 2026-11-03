Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79726606A324
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 05:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=i6dvi5nW;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sv2pKMXE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6V+GKV6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=t3XRZvz+GQC0yOihm0T5lJcwUKciyujg/5Kq0kHZDdE=; b=i6dvi5nWGXfL94
	T7ONLlXFvCcY3qKZFANt7EgDbcApcZzC8CNh/Oj/t15l0wqozNkpLSW74jyzDZD3vDwNervRSvqom
	9nWMZwnEscWI/jfz41EAycV396QswAODrRYARBB/7qB+B9QBtwCrWR25BGxCdvdAeZNVJAVnRseGB
	om1hWbUZfLBWZqJF+/dc0hzD02WO1q0Qsk6GRgyCizkEO0R3fzUa414Ek3MfCWojgAm7GMh6W4M6A
	Jh7NhvDfuVhFMyd25sxritiogfaUHrQF1PaJS0CMOTdG0zGHUL6dRG01jnyrBqmnQdkls+wzDu5Xd
	rYw7W0qKfj2v+kcP1zoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6uD-000000017bP-0v74;
	Tue, 03 Nov 2026 05:17:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6u8-000000017ad-3nwZ
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 05:17:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eLCk2403837
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 05:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3XRZvz+GQC0yOihm0T5lJcwUKciyujg/5Kq0kHZDdE=; b=Sv2pKMXEUi0yq3hU
	/ur0DJLeq+su8neJpf/cY66WHmwOiUqqyvxAl8EgNWavlsgJejFotK9wfa15vI5B
	vGNhLqvodqQy59sU6FLsGK6a3qaqaybTG7e8riPZR7yAg9wXwIwrAF11v2hib7jg
	TgfvQqA6It0Su7sfFiVRI2tO5zuAZwPt45X7Jvx4VYi/N7MDVpQPNyBgouTBVmKk
	g6HQktUtNR0Tq4OxUAOuWytna65pv6GuKm5zDSjanPH8Vb3pqJxGNh2f29PwHSEU
	IMF8s8j8sV0f3V9jkW8EL5GejVCIJbMLfPILLl3wZJfeE7wAyj71KMppNTWV8mAy
	Sub/TQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy165m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 05:17:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e93e2f72bfso62020655ad.3
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 21:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683071; x=1794287871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t3XRZvz+GQC0yOihm0T5lJcwUKciyujg/5Kq0kHZDdE=;
        b=f6V+GKV6sKr52JkNRjk9OkDC5AcqOZVDRPaBtfG8p/hhm3OMN+3Rppqikmf1o4f1yQ
         0kXbtWnOSrAUn5vrg/4mm3djPj3DUhZoWWpfoxecCDJSIVFsEWjcNA3KvUWxBsrqJE5i
         EFPiGtlIkFhXLM+Mge98ENAimGoBKaSfhds1IZll18TtO+Ejkd98wzWg9eCNrfx5o41r
         lGeZ6/mNtWxKGf1k+Jw+77GsZ89dPvPiYv3oX43bI49ooGql7Atxf+ALn4hQz1EZovAv
         ySD/ewKAt9FF08DAb6Sz9VoqSZzFaOIUHCn4v5yZmlP6jwGpMSAzFCb3cObXAqicNFlp
         RLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683071; x=1794287871;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3XRZvz+GQC0yOihm0T5lJcwUKciyujg/5Kq0kHZDdE=;
        b=08bVeaC/FUeB2OIt9cxRqVN0bdGHCJSj9nyU+bZQ2fX8j2mAmmOezMBMme66kQMyqO
         aQ8M/5b8URfdbQYnsht932lrNcuN1FeYd8bZ+uOrdEieeVfF8f/lPmP4+W9iSZLB0JDn
         s4dB45sdWqlIIaRNusZZwovceZhaWyTdA1MztdAjOBXVzwx4K3HIB2ALaUOA4MCd9d5u
         wE9ZJbFk9at+uiDVPAGvGfUVQIJ8OiHxr1gph+xMMC4sAwWb5lbDucnGRDHMk+MwmhwY
         Yzi6FvC+qEIaQDVYxNrhmcm0mrWDZiaq9AQLs6gpgkhhGoEWxsdFF6Qp7fSTwKQfV6g+
         oung==
X-Forwarded-Encrypted: i=1; AKwUvBxW00nYHoeFgptVisBp7jXXXWdNBfYH2lqjUFcLkoiMhI7+UcHFnq8HTr6gBhRzDUnKv69Dgd4=@lists.infradead.org
X-Gm-Message-State: APuU4Z97uqvTMoL8IXWRVghfYfsPBSw6ckZYjKLJdD411MFsLt//Cq6o
	MQyE3entMdWlb7WueQUgSku9nRA6iZ6aHJyYpd0xyWyVGOJ3lPonSrQM8SfwD5z0Fc2LU9WRoSi
	dT1kwwSCJtAV7puVluOAjHYBCWP+4BupnRvFDQoXV5f2uCHGn2S0fRb+p05IPCLUC
X-Gm-Gg: AYBFou2x0GDLsd4EFrV53yl4js1NrWL+0/jkL9ZatODWUJXAYAfcW7wWvITcxzBHczd
	ytHIHXWwgTKgvNx1ZOk7e9harszVX4y3tnhn6JaOZk9kdadqq1OOO4mghKr78ttPIJClqruhNqk
	9N41sHzmCeasnHOAyVjqKN/pif7mIMxSEpJMpqHNT3Sbbx++QbJwASAIh2mxgl6/iIu7BxapSII
	D5Kajg/9t0D1LuIg909p6sXRNx/zYrC8FQIY9/zmUGor9iUTaRdDki796/jo/h5QNLLePgG41FR
	oHt09RLJUty56OQXWv5TeXaSWk37OHZVR6HGhLtRWGCWR+e7/7542wKRDroTueTG9Hnj+FxFBhz
	hp9Oy2gNLCRpXAMj3SxhhQzYCeIxjg5H2z/SKIpLJUk1QG0BgKuEuu3vazkQQiNlt2QppwvjelW
	So7D769oSKbI/sB2uN67jNiR7DOAdfn1CCBo4LD2vxRj8=
X-Received: by 2002:a17:902:ec90:b0:2e8:1910:e398 with SMTP id d9443c01a7336-2eb3649bf6amr123263995ad.9.1793683071556;
        Mon, 02 Nov 2026 21:17:51 -0800 (PST)
X-Received: by 2002:a17:902:ec90:b0:2e8:1910:e398 with SMTP id d9443c01a7336-2eb3649bf6amr123263855ad.9.1793683071109;
        Mon, 02 Nov 2026 21:17:51 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392aa7absm34704185ad.65.2026.11.02.21.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:17:50 -0800 (PST)
Message-ID: <a3df1c77-4b9a-42f8-811a-c2f662835199@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 13:17:48 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Burke Cates <burke.cates@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <20261103040533.3388284-1-burke.cates@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103040533.3388284-1-burke.cates@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: LGzUKe4uqTv4uOi10IqxXYCAw7naEFAY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX1fHVUnueVcQZ
 Pue+jjYTiM89xZc8kT7NRADBRXCcLygklRYvVFoIsTpPgyQcJP7blBWdloVU6XZTWGV1h0J4bTC
 rJ+DyaLn0J4Rr6hlgd7zDNw+Z4RD3n9jRqP+IANIVSPVa7N/AgHKfjbHFxbC+xASeFGEG+ii7fE
 4SarqxH8f47XXaLYRam0LwrngzQdIu+oBVt/lajZuS0VPfT8Fqia1w1/eTmU1RFGWmJxZDWqiaR
 jAF1f87TIK5swfkNBZk3nyShFNyrTRbZTfg8puJ7SyD4BkMH3StRrRjw+wgqqriveqL6V3rR2gh
 5QeeN6gYBgPj/nr7xbTfnDdhrfSZzXzg4MVpAPUolUNogOQ8LkpKR8wwIA82FSXNMTmuySmMg5i
 OVIZ59fnW7k+fyNhjxNpF023caIktp4b1B/E5oWRYGkuLTgNXIh1jnkeiDx5QRsnH10qJIbvffX
 QfDkvcSvZy2UiK5e/mQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae96e80 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=llqbz5aeeJgODjPUjo8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: LGzUKe4uqTv4uOi10IqxXYCAw7naEFAY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMCBTYWx0ZWRfX8f6td93etfJF
 UuSomeXZrSOJF7Db7qPIVlPmiLoRstr5YeQ0hAsETHjm3NkvVQ+o5REUyf72tRq59AjConFtmyK
 /+NO7tziutCAFIOCq8gp2UReuCbGqog=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_211752_951486_9DF17CEA 
X-CRM114-Status: GOOD (  11.62  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/3/2026 12:05 PM, Burke Cates wrote:
> On Mon, Nov 02, 2026 at 02:38:09PM +0800, Baochen Qiang wrote:
>> ath12k currently relies on hardware link id to resolve the link peer. This
>> works for QCN9274, IPQ5332 and IPQ5424 but breaks WCN7850/QCC2072 which use
>> logical link id instead.
> 
> Tested on an ASUS Zenbook A16 (UX3607OA, Snapdragon X2 Elite) with
> the on-board QCC2072, on v7.4-rc1 plus c752394249f8, 02121aa4a012 and
> 1e678e37ff13 from ath.git and out-of-tree Glymur platform/board
> patches, without Miaoqing's "fix MLO 4-way handshake timeout on
> QCC2072". All 11 applied as posted.
> 
> A Wi-Fi 7 MLO SSID (SAE, PMF required, 2.4+5+6 GHz) that used to fail
> with reason 15 connects as MLO with three links: 12 of 12
> connect/disconnect cycles and 5 of 5 rejoins after s2idle resume,
> ping OK each time. Non-MLO 5 GHz is unaffected. The firmware sends
> PEER_EXTENDED, so the host allocation in 8/11 was not exercised.

Yeah, QCC2072 firmware has that support. Only some old WCN7850 firmware don't have.

> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607OA)

Thanks for the testing.

