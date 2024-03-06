Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7DDC54E41
	for <ath12k@archiver.kernel.org>; Wed,  6 Mar 2024 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/+a42a8dIwOABIVlekjDLxvmD3PN+m47VNc/x7QutA=; b=1kNbSr2miqCW5QEX1LIsWhyArW
	mzi839rGo/fwCg6YuDc4MT0WG1JfvUpOAIopTG7eRIbEMQEh0fd2JU++c5JvVAlj/Ab4w9WBGawUe
	GCJTqizB4pydiQ52Ev4aJQLIfv6NFjoGJE2ROuJGrPgzoZNgiP8r2yWMV652JCFpj41mdhJvsTEoD
	kKM3dhhnmo9r3njSlEiDMahwEOFSNEDu52yWrltGYzNSC/H70W3VTwJgRhx4mp7O5YSMT9c+R4I3V
	ftLsViDPwnIylQ28g83JprLwju4Hx//2AWSupnI7xGQtQovi6tuhC7c2u+OefxYL8v2AHKQXblwaB
	mQgnHhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsaB-00000000eac-3NCd
	for ath12k@archiver.kernel.org;
	Wed, 06 Mar 2024 14:49:23 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhsa7-00000000eX5-0IA7
	for ath12k@lists.infradead.org;
	Wed, 06 Mar 2024 14:49:20 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5135540c40dso2297985e87.3
        for <ath12k@lists.infradead.org>; Wed, 06 Mar 2024 06:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709736555; x=1710341355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/+a42a8dIwOABIVlekjDLxvmD3PN+m47VNc/x7QutA=;
        b=XASCJAwee+ZmQp5F/EDTc87f5zb+YW0+4WsDC7jhBEREp9/23YWW7cLSusTuXvm9jG
         VhvnQMa5VqPeYpsZtzF5/p/7PnC3nhDBB3tmaZGv42ABUGF102moL/rL2L6FCj2oiRbu
         MNew+8MTXoQPgJyOcrPpLAFDIcGVBc7koQpQcSaTK+oXEE4UK5f15jjIK99o0xwc4q0Q
         lm7Pqo/pwTFLjO3kyNi7GsPB4879ANrCG4ei7S/ZW6K68EKEBwjnDhAgpKwg90GbwZST
         h0/cMs2vjSmJcA+owIg0lhNJxvwa6o4DpkT3ZVfcWYyLEt3nmHuYYJ/brVRssH0CpqvD
         F60w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709736555; x=1710341355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f/+a42a8dIwOABIVlekjDLxvmD3PN+m47VNc/x7QutA=;
        b=QqSBL3KxQr3bR87SJ4A37g/3M946G+OBvpQzRSqW6LwiQOpjd/ldqx7FEHlKx9e4h3
         1Ih2mumTj1o5gaMBju1bFcqYoPgdAO9m5wFSnEKY2biVxcPi3ykisSrkJknu3VYYhRNp
         oItQ0ef2sq+xqGrQFjCYlLY6wsjk0UnKh8Hx5r8PhrfG5PRnVGIMKsuw3XB3r/06zm2D
         YO5dVxFmxHhNShNkrc8Sa1KNWJsKtkQu9CxJiZZbQN0vFhdMfRb/DTliXR9LDcH1UwvQ
         Z+dMWx0Gc0irRxt2kFd4kdVYcqrfyKeurDUUpU1Mo/ECZLC6Xptqhj69Fa38cNwaF6M8
         314w==
X-Forwarded-Encrypted: i=1; AJvYcCUC1vlCW5EvWKDmOuEA1QXGKQAJ+OsweyC3o2MpxvzhVZjEhzafd0e4WFOFtfnqMJTaZyS3xbvB3KLGEqWeiwL9yTfKa767+G6Dfw==
X-Gm-Message-State: AOJu0YwzYLvTgd/EjJEkTKnuAimotQOdSbVGNSEDi7r4TkSqAWY63GCB
	rDio16+68deHRjAWrDcQC/ddwqewJFdIH4q82MmHfq12zDrfhAySRxtdphWTDQSSjP6jU+LMZOX
	L+1LyThkoB8yHeRLnULrM7m2ubxRMnF0zkqChjA==
X-Google-Smtp-Source: AGHT+IHuaWdoUHbcJDBFfAGuFIEuJEUhRnUawOmPrUN5LEBQIfShw+5+q076BJ1ahece4c9tq0o3LEnmcxBIfeuH0CM=
X-Received: by 2002:a05:6512:3489:b0:513:1a38:2406 with SMTP id
 v9-20020a056512348900b005131a382406mr3396286lfr.13.1709736554753; Wed, 06 Mar
 2024 06:49:14 -0800 (PST)
MIME-Version: 1.0
References: <CABymUCNgjWMmfBAWJtzsd96iw5o0nxO8K8pdK_YJjkyjv-1roQ@mail.gmail.com>
 <ded15bd4-7b89-467e-829d-62b1067e1f03@quicinc.com> <CABymUCOuxnJH6o15VFihx0xVNjcdaUtpaEuQO-NGHhjaEiLWbQ@mail.gmail.com>
 <25c22014-bb26-414e-a29f-8ed97c1ef465@quicinc.com> <CABymUCMntFfKPRZyv+PzmNB3WejG7v5Y1-AYhXRK1o++U_xnRQ@mail.gmail.com>
 <aa92159e-d2e3-44d4-8514-2c81591cff31@quicinc.com> <CABymUCM-9a6z-PPYm=HaUREZ4rjxaZtqxZB7Via4h_vM2wK2QA@mail.gmail.com>
 <2b978117-cd72-42ca-a5d0-fd7a7c644e5c@quicinc.com>
In-Reply-To: <2b978117-cd72-42ca-a5d0-fd7a7c644e5c@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 6 Mar 2024 22:49:03 +0800
Message-ID: <CABymUCOe7WGKV07JEa7ZvqNzsqSb=jEgdvj0T=S=MMrBUEwGow@mail.gmail.com>
Subject: Re: 6GHz AP association failure on WCN7850
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, kvalo@kernel.org, quic_periyasa@quicinc.com, 
	ath12k@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_064919_136299_301329F9 
X-CRM114-Status: GOOD (  28.01  )
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

Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=B8=89 14:45=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 3/6/2024 10:25 AM, Jun Nie wrote:
> > Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=885=
=E6=97=A5=E5=91=A8=E4=BA=8C 16:30=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >>
> >>
> >> On 3/4/2024 6:14 PM, Jun Nie wrote:
> >>> Kang Yang <quic_kangyang@quicinc.com> =E4=BA=8E2024=E5=B9=B43=E6=9C=
=881=E6=97=A5=E5=91=A8=E4=BA=94 19:42=E5=86=99=E9=81=93=EF=BC=9A
> >>>>
> >>>>
> >>>>
> >>>> On 3/1/2024 5:14 PM, Jun Nie wrote:
> >>>>> Hi,
> >>>>>
> >>>>> I see there is association failure many times when I try to connect=
 my
> >>>>> 6GHz AP with latest mainline Linux. Does anyone also observe it too=
?
> >>>>> Any newer firmware than WLAN.HMT.2.0-01734 is available? Or we
> >>>>> recommend any specific version firmware?
> >>>>>
> >>>>> The issue only happens with this version firmware:
> >>>>>      [    9.441624] ath12k_pci 0000:01:00.0: Hardware name: wcn7850=
 hw2.0
> >>>>>       [   10.058822] ath12k_pci 0000:01:00.0: chip_id 0x2 chip_fami=
ly 0x4
> >>>>> board_id 0x3d soc_id 0x40170200
> >>>>>       [   10.082876] ath12k_pci 0000:01:00.0: fw_version 0x200a06c6
> >>>>> fw_build_timestamp 2023-09-20 03:43 fw_build_id
> >>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.2.0-01734-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-1
> >>>>>
> >>>>
> >>>> Wrong firmware.
> >>>>
> >>>> We use WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 and
> >>>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4,
> >>>>
> >>>> https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/=
WCN7850/hw2.0
> >>>>
> >>>>> I do not see the issue with firmware:
> >>>>> [    7.896737] ath12k_pci 0000:01:00.0: fw_version 0x1005bc12
> >>>>> fw_build_timestamp 2022-10-11 12:13 fw_build_id
> >>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_S=
ILICONZ-1.15378.4
> >>>>>
> >>>>
> >>>> That's it, i recommend you to use
> >>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3. It's new one.
> >>>>
> >>>>
> >>>>
> >>>>> Detail log can be found at:
> >>>>> https://www.dropbox.com/scl/fi/jgn1zbnw44i1vypbjxl0v/ath12k-6GHz-as=
sociation-fail-log.tgz?rlkey=3Dpg2ifnzcttzimz7vaxb7tuc6w&dl=3D0
> >>>>>
> >>>>> Jun
> >>>
> >>> Hi Kang,
> >>>
> >>> I see wlan0 failure with below log with firmware version
> >>> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4.
> >>
> >>
> >> Can you check if you completely replaces our upstream version?
> >>
> >> It is best not to mix it with other versions
> >> (board.bin/board.bin/regdb.bin/amss.bin/m3.bin).
> >>
> >> Mixed use may also have an impact on throughput.
> >>
> > Yeah, tried to replace all binaries from below path, but no help.
> > https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN=
7850/hw2.0
> > https://github.com/kvalo/ath11k-firmware/tree/master/ath12k-testing/WCN=
7850/hw2.0/WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> >
>
> So, both WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4. and
> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 have this problem?
> Their log is the same?
>
>
>
>
> > What's your test platform? I use sm8650-hdk. Not sure whether there is =
something
> > platform dependent.
>
> Our test platform is x86 devices(normal x86 PC or x86 board).
>
> These binary can only be uploaded after detailed testing on x86 platform.
>
>
> > These binary was tested OK with Linux mainline on some QCOM platform, r=
ight?
> >
>
>
>
>
> Your platform is arm. Actually, we never test whether upstream firmware
> of ath12k can work well on other platforms. Any errors could happen.
>
>
>
> Did you download this firmware by git clone? Or just download manually.
>
> Please retry with git clone if you download manually.
>
>
>
You are right. It is downloading issue. binaries from git clone works well.
But 5GHz performance of version WLAN.HMT.1.0.c5-00481 is worse than
the 600Mbps on version WLAN.HMT.1.0-03427. The 6GHz performance
is similar, ~160Mbps. Do you what's the improvement of new firmware?

[  5]   0.00-1.00   sec  2.62 MBytes  22.0 Mbits/sec    0    144 KBytes
[  5]   1.00-2.00   sec  4.75 MBytes  39.8 Mbits/sec    0    335 KBytes
[  5]   2.00-3.00   sec  7.62 MBytes  64.1 Mbits/sec    0    622 KBytes
[  5]   3.00-4.00   sec  14.4 MBytes   121 Mbits/sec    0   1.15 MBytes
[  5]   4.00-5.00   sec  53.1 MBytes   446 Mbits/sec    0   2.35 MBytes
[  5]   5.00-6.00   sec  42.2 MBytes   354 Mbits/sec    0   2.91 MBytes
[  5]   6.00-7.00   sec  58.9 MBytes   494 Mbits/sec    0   2.91 MBytes
[  5]   7.00-8.00   sec  60.8 MBytes   510 Mbits/sec    0   2.91 MBytes
[  5]   8.00-9.00   sec  55.6 MBytes   466 Mbits/sec    0   2.91 MBytes
[  5]   9.00-10.00  sec  57.4 MBytes   480 Mbits/sec    0   2.91 MBytes

Thanks for your info!
- Jun
>
>
>
>
> >>
> >>
> >>
> >>
> >>> Do I need any patch outside mainline? Actually, I add below 2 patches
> >>> for 6GHz band.
> >>> afb7a22d9e22 wifi: ath12k: build 6 GHz regd based on vdev type and 6
> >>> GHz power type
> >>> 6c60469f0bae wifi: ath12k: add support to select 6 GHz Regulatory typ=
e
> >>>
> >>
> >>
> >> If problem still exist, please revert these patches and check again.
> >
> > Reverting them does not help as expected.
> >>
> >>
> >>
> >>
> >>>
> >>> [    6.194535] ath12k_pci 0000:01:00.0: setting mhi state: INIT(0)
> >>> [    6.195067] ath12k_pci 0000:01:00.0: setting mhi state: POWER_ON(2=
)
> >>> [    6.195069] mhi mhi0: Requested to power ON
> >>> [    6.195083] mhi mhi0: Power on setup success
> >>> [    6.196541] mhi mhi0: Image transfer failed
> >>> [    6.196559] mhi mhi0: Reg: ERROR_CODE value: 0xef128100
> >>> [    6.196574] mhi mhi0: Reg: ERROR_DBG1 value: 0xff7fc000
> >>> [    6.196588] mhi mhi0: Reg: ERROR_DBG2 value: 0x0
> >>> [    6.196601] mhi mhi0: Reg: ERROR_DBG3 value: 0x1988
> >>> [    6.196631] mhi mhi0: MHI did not load image over BHI, ret: -5
> >>>
> >>
> >> BTW, is it a probability problem?
> >
> > It happens 100%.
> >>
> >>> Kalle,
> >>> Thanks for the reminder of attachment size limitation!
> >>>
> >>> Jun

