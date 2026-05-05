Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0A8FF8855
	for <ath12k@archiver.kernel.org>; Tue,  5 May 2026 14:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=; b=RKZA60b9xPTiFlFYYxmG+FYFnt
	lhoUNrnVywtUd+RoyjDT5y5M7EaAg+ixr88Xb5M3vIJ3E3Wg6dIztC4VCEqivMxyyxcJSZbjaxUaF
	seg/akypnfXLJuuLu6vL6+zzpECmN1Ewdt90HFQzWncDNbBPXd5dXexd4mgPKX4pLAOSwTwrmeauA
	RbzpHp8IODgU3WmkL5gsL+c8yQ7WTuIBN8g6yS+YTBh0BNwX5EygbDpvEXJbZKoWDKkySsw0f/Deu
	MPGGwnXgPFHcxqRNuAxqlNIQGeNSQOdL4QodWC6uvtQ4xtMwWUhoUOCJH04MrL6/aQ+Q8n7WL5FyF
	vCHw0ZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMF-0000000GQBc-0GSG;
	Tue, 05 May 2026 14:02:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGMD-0000000GQB5-2fsf
	for ath12k@bombadil.infradead.org;
	Tue, 05 May 2026 14:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=; b=OufU+7hSAsihknst3TLnsEVPZx
	8oLVislrrdHLY8RsOt6sEExDleGw6WV+vdGC3w3dBsx2i4PxcClYfRQRuZ/QhZoKR0tnT7+68h3tc
	U+OqXdTpo7pT6FIEdJ2MuT7/qIWL/RQfO6NlSxrBoYPsFYbGrJ4GGS4DelkffKO9PnjEdM4/h/whB
	IKbzKBsOGN9jkkdPz344tNsZ/CERUkz+ny/fUlYuAzNwdZnmwFVxK1Ia4hrkyUgQUf9wtgVj/fpGk
	/1OT8uB9RdESO81qCAZ3Y/FKkCUBMYHJgseRXzH1+wD8n6mziDnPVe7ectYyRcJ6sW0f6QsRQ6atN
	TKkV+P6w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGM8-0000000DiBd-3OLU
	for ath12k@lists.infradead.org;
	Tue, 05 May 2026 14:02:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458p2XD3409246
	for <ath12k@lists.infradead.org>; Tue, 5 May 2026 14:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NX2GqVOMLwVw8Cryw7SY8Q
	QJe69k3Ra4iwriZpqn3SU=; b=CCQc0WFp7xQXWugeo64R2XJr94jSLF1YAvgDNm
	yTRys/qkD3xKviO47iGpe2h4ekOkNlhwkozr4XcFTCGIanp3x+YegqC5PUsiXYJO
	NrEnl+cRRfxC9r7XR0gEk7fWMVB68/3p1tT6/hUms0rZgcwdFM8dGC8abZQfSe4z
	pC63Pmp5olLFX9Lrn9Bx3EHu92osJhnESfUPZkSgLlfcW5xgc/3eDe0MHfVM3e2C
	uVT/iBPaKSzBa96EaVmavR1gRB5HdbkO9gEgrSjavO/+Ra1pJ0lovNsIXug3/uay
	CFBUJrsXvQT1dFW1agxe1G2PirwBepIT4ElliPmMWTeuJ+PQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00vdeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 05 May 2026 14:02:33 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-130aab787bcso3252120c88.1
        for <ath12k@lists.infradead.org>; Tue, 05 May 2026 07:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777989752; x=1778594552; darn=lists.infradead.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=;
        b=kHyJEMLFJoYoHpmiX+m4LfQNUxmp4KxGvMBzHzcSuqJ8YxRyMIHb1o3YVNG3qx+O4+
         IxnO8xuqOy00HWCB+MLQpggryh6jMXQKv0dNdgB0/2IwZVisTmzwzEawH+0Ptq2N4Q5P
         r+LmZb6+SNXcyO8DzQvdlK8Pgf2T3Zj96LlUxIxb/oOW01+iNR3osB8rzsJF0wgvxpR5
         tGHeTaXvZZA2Bo8ZeQR4ZKO9dcORuz5DD+2gwN2dGjf/aYs8Fk8MHljjEWsJ12Wu3gqm
         YQaVYEsYDL0TsorrYaS7ly8kSptgQm5YPBlFP5qq+5n6jZxL0kkDxMcNzA45TWq6KrOQ
         song==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777989752; x=1778594552;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NX2GqVOMLwVw8Cryw7SY8QQJe69k3Ra4iwriZpqn3SU=;
        b=sqyMX3VmVUifw8yrnQ9RQlFBGed5SSMsqA6aCkcYSn+KNVXqyXqugR1JGmRUnbWXAX
         LafkAtBYUDHpYju9aKzP9VxUWfpE1bjEhXtHvAtWPRe5QInycEZWy+uZpTBwhbSUrFOS
         Zl2Tuqb/arTko5Onwvu8mSdIAUAAHSPAhO/9K8dXoRebZdUpZI6qBX1BE5OuTFW2pnBt
         X0qRKP5gcK0iyAk2/9K8kNjzy//0dHebmMIA2W4xrIaxzPcowV9909RHnQRRl/criz36
         AwEQOBM88/83LOIgUEn3iZTYZ//8b2UArVMqHcmRQA3YbXM00XB4MtQNzeRREL0jSvdT
         K/Ww==
X-Forwarded-Encrypted: i=1; AFNElJ+DhZkK6i9sAflpf0JRHJFxPgaBmNCj5qHJeCJp6DEffY7zg8dwLVPNxpgspbF5oRSJyDSiP5Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyooBm63s2zYTMIkV0aTBaE3/tzfkPBLGZ9s2iu0g1FTWqJHNnp
	b+teLkncPaooypdMfLVcSM+iPcpGb/xAV6FBAJREWKrRzOJ1uVB1IqKy0Z87TeblZO97Dxccqpw
	DDgNMTYv+wioGjpfDMMXwuPWxg72Jhls2pyPupVKJ8LPOM78BK3r79sFr4yBPRodi
X-Gm-Gg: AeBDiesCwhZL8zcCJvVSaiUa5bW1T9Fi7RntR/GzIw7M9uh3oZN6nAA1NpAKSeJ+Ekl
	2POlTzVA02Ej+mzQrzdjXB455axmxQ3gtApAUG5TnDVTbrpQaJoLDdUZdGTluhN7L276nRnofXy
	AqRw4WE/ENSe44dFet23V7s4C207cLOMkcuCsS9VRr+Xs5uX9yRN5htrTB267q9YuZZbajSgZtl
	cI0l5lLjyflenCzmVERBemULmrDBVsNVrr95iG42BWVILgvzNqN+6Lnsa2Rn4aus5OpmCc/Xgns
	Gi21XXRZZKUwKxPPU50b6lX9/80B3RdFqthmu9zMIWkOaR33FW8JuaKSabA2kueFI20lC4pQe6y
	0c2RHMSi23S6pxT7OO/6tXuvTs7LZZOrDv06Js1P911eN/12GOEQuVn1aXzb/Fth8pX/o
X-Received: by 2002:a05:7022:660c:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-12dfd6ef2ecmr7329908c88.0.1777989751692;
        Tue, 05 May 2026 07:02:31 -0700 (PDT)
X-Received: by 2002:a05:7022:660c:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-12dfd6ef2ecmr7329781c88.0.1777989750591;
        Tue, 05 May 2026 07:02:30 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df843f04esm17828716c88.13.2026.05.05.07.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:02:30 -0700 (PDT)
Message-ID: <1078e0dd-4d30-4cc1-8ca8-426099127efb@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:02:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: pull-request: ath-current-20260505
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f9f879 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=gN_giuKsPDD6efEbj5cA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzNCBTYWx0ZWRfX6nd+9W5R2Iio
 ftuBpor4WUCNoksyq4XT+YaAUXgovGet9ED8J4gmfJ48RgarlkCykwnulx+6DfrpTq4707Fc5Re
 djxm3OpDIy9wajigIUCfweFPk4JqsSCrqOf2scqpSUlhWel6LS0tuk67W/DX7hc2LbyccDxM1jO
 5Y/bdEfi/O7zqwaUqjuXvXLwGXZDYU2FhxQ7f8ztcT0W10ZgEvq/UphAC3RdVa1yCFQdbokSd4r
 gjE5e5fhIZ0b+BpLqeS2bNjxaleZ8YgbC0Wmt8BGV372NcgGLPxg0hHujrY7JavHbAAP+vKM2d9
 iITF7eXwdaIN6A8oVGf7OgxJ54nzMgF12abnima6iwZHhtvgBPz/TzbD3h1jWqVe0U/JoBUZq4R
 +cwcUGUJw+pfQVnyHbjxUkMgkffMXXc9bKtEuI7+HKi3QzEohZllMkpWSEld8utDze1ZTs9Qbuo
 JNe63O0JIUMK3kpaK6g==
X-Proofpoint-GUID: 1EZVrG9gvJ1IF0TpnVDNdp9DAVRDtyBJ
X-Proofpoint-ORIG-GUID: 1EZVrG9gvJ1IF0TpnVDNdp9DAVRDtyBJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_150237_244081_1B5423AE 
X-CRM114-Status: UNSURE (   8.45  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit d997c32157d2ca06e9f3f00ba6c4bf06593b49e7:

  Merge tag 'ath-current-20260427' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2026-04-28 10:41:51 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260505

for you to fetch changes up to d748603f12baff112caa3ab7d39f50100f010dbd:

  wifi: ath5k: do not access array OOB (2026-05-04 07:15:20 -0700)

----------------------------------------------------------------
ath.git update for v7.1-rc3

Fix an ath5k potential stack buffer overwrite.
Fix several issues in ath12k:
- WMI buffer leaks on error conditions
- use of uninitialized stack data when processing RSSI events
- incorrect logic for determining the peer ID in the RX path

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: fix peer_id usage in normal RX path

Jiri Slaby (SUSE) (1):
      wifi: ath5k: do not access array OOB

Nicolas Escande (1):
      wifi: ath12k: fix leak in some ath12k_wmi_xxx() functions

Rameshkumar Sundaram (1):
      wifi: ath12k: initialize RSSI dBm conversion event state

 drivers/net/wireless/ath/ath12k/dp_rx.c |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c   | 105 +++++++++++++++++++++++++++-----
 drivers/net/wireless/ath/ath5k/base.c   |   3 +-
 3 files changed, 92 insertions(+), 18 deletions(-)

